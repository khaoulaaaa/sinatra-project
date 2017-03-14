get '/services/:process_id' do
  status 200
  @service.to_json
end

get '/services' do
  content_type :json
  Service.all.to_json
end
