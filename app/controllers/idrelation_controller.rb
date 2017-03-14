get '/idrelations/:idrelation_id' do
  status 200
  @idrelation.to_json
end

get '/idrelations' do
  content_type :json
  Idrelation.all.to_json
end