post '/users' do
  before_action 'POST /users'
  user = JSON.parse(request.body.read)

  # prepare params
  password = user["password"]
  user["encrypted_password"] = Digest::SHA1.hexdigest(password)
  user.delete("password_confirmation")
  user.delete("password")

  # create user
  res = User.create(user)
  if res[:success] then
      status 200
      res.to_json
  else
      status 400
      {success: false, error_message: res[:user].errors.full_messages.join(",")}.to_json
  end
end

put '/users/:user_id' do
    before_action 'PUT /users/:user_id'
    user = JSON.parse(request.body.read)
    res = @user.update(user)
    if res[:success] then
        status 200
        {success: true, user: @user}.to_json
    else
        status 400
        res.to_json
    end
end

get '/users/:user_id' do
  before_action 'GET /users/:user_id'
  status 200
  @user.to_json
end

get '/users' do
  before_action 'GET /users'
  content_type :json
  User.all.to_json
end

post '/auth' do
    auth = JSON.parse(request.body.read)
    mail = auth["mail"]
    password = auth["password"]
    user = User.where(mail: mail).first
    if user && user.encrypted_password == Digest::SHA1.hexdigest(password) then
        rsa_key = OpenSSL::PKey::RSA.new(settings.rsa_private)
        payload = {:exp => Time.now.to_i + 30 * 24 * 3600, user: user.to_json}
        jwt = encode_jwt payload, rsa_key, 'RS256'
        {:jwt => jwt, :success => true}.to_json
    else
        status 401
        {:jwt => "", :success => false}.to_json
    end
end
