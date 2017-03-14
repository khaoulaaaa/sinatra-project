class Ssrelation < ActiveRecord::Base
  validates_presence_of :sender_s
  validates_presence_of :receiver_s
  
  def self.create(ssrelation)
    ssrelation = Ssrelation.new ssrelation
    res = ssrelation.save
    {success: res, ssrelation: ssrelation}
  end

  def update(ssrelation)
    ssrelation.slice!("sender_s", "receiver_s", "protocol")
    ssrelation.each do |key, value|
      send("#{key}=", value)
    end
    save
    return {success: !errors.any?, error_message: errors.as_json(full_messages: true)}
  end
end
