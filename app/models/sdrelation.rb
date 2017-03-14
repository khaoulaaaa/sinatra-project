class Sdrelation < ActiveRecord::Base
  validates_presence_of :db_id
  validates_presence_of :service_name


  def self.create(sdrelation)
    sdrelation = Sdrelation.new sdrelation
    res = sdrelation.save
    {success: res, sdsrelation: sdrelation}
  end

  def update(sdrelation)
    sdrelation.slice!("db_id", "service_name")
    sdrelation.each do |key, value|
      send("#{key}=", value)
    end
    save
    return {success: !errors.any?, error_message: errors.as_json(full_messages: true)}
  end
end
