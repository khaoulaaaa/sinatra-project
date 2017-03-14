get '/dependencies/:dependency_id' do
  status 200
  @dependency.to_json
end

get '/dependencies' do
  content_type :json
  Dependency.all.to_json
end