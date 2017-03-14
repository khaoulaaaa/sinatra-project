class Instance < ActiveRecord::Base
  validates_presence_of :ip_address
 
  validates :ip_address, uniqueness: {}

  def self.create(instance)
    instance = Instance.new instance
    res = instance.save
    {success: res, instance: instance}
  end

  def update(instance)
    instance.slice!("ip_address", "N_services")
    instance.each do |key, value|
      send("#{key}=", value)
    end
    save
    return {success: !errors.any?, error_message: errors.as_json(full_messages: true)}
  end
end
