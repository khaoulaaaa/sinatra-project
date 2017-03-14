get '/sdrelations/:sdrelation_id' do
  status 200
  @sdrelation.to_json
end

get '/sdrelations' do
  content_type :json
  Sdrelation.all.to_json
end