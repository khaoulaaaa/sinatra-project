class Sirelation < ActiveRecord::Base
  validates_presence_of :ip_address
  validates_presence_of :service_name
  validates :file_name, uniqueness: {}

  def self.create(sirelation)
    sirelation = Sirelation.new sirelation
    res = sirelation.save
    {success: res, sirelation: sirelation}
  end

  def update(sirelation)
    sirelation.slice!("ip_address", "service_name")
    sirelation.each do |key, value|
      send("#{key}=", value)
    end
    save
    return {success: !errors.any?, error_message: errors.as_json(full_messages: true)}
  end
end
