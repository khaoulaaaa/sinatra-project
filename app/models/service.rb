class Service < ActiveRecord::Base
  validates_presence_of :id_process
 
  validates :id_process, uniqueness: {}

  def self.create(service)
    service = Service.new service
    res = service.save
    {success: res, service: service}
  end

  def update(service)
    service.slice!("id_address", "service_name","language","status","last_update")
    service.each do |key, value|
      send("#{key}=", value)
    end
    save
    return {success: !errors.any?, error_message: errors.as_json(full_messages: true)}
  end
end