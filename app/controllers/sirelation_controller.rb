get '/sirelations/:sirelation_id' do
  status 200
  @sirelation.to_json
end

get '/sirelations' do
  content_type :json
  Sirelation.all.to_json
end