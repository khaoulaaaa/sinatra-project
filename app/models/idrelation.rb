class Idrelation < ActiveRecord::Base
  validates_presence_of :ip_address
  validates_presence_of :db_id


  def self.create(idrelation)
    idrelation = Idrelation.new idrelation
    res = idrelation.save
    {success: res, idrelation: idrelation}
  end

  def update(idrelation)
    idrelation.slice!("ip_address", "surname", "mail", "phone", "address", "locale")
    idrelation.each do |key, value|
      send("#{key}=", value)
    end
    save
    return {success: !errors.any?, error_message: errors.as_json(full_messages: true)}
  end
end
