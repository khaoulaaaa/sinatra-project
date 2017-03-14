get '/ssrelations/:ssrelation_id' do
  status 200
  @ssrelation.to_json
end

get '/ssrelations' do
  content_type :json
  Ssrelation.all.to_json
end