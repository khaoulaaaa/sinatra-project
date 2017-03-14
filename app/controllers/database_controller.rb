get '/databases/:database_id' do
  status 200
  @database.to_json
end

get '/databases' do
  content_type :json
  Database.all.to_json
end