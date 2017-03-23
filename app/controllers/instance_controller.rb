
get '/instances/:instance_id' do
  status 200
  @instance.to_json
end

get '/instances' do
  content_type :json
  var=Instance.all.to_json
end

