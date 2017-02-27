class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :phone
  validates_presence_of :mail
  validates :mail, uniqueness: {}

  def self.create(user)
    user = User.new user
    res = user.save
    {success: res, user: user}
  end

  def update(user)
    user.slice!("name", "surname", "mail", "phone", "address", "locale")
    user.each do |key, value|
      send("#{key}=", value)
    end
    save
    return {success: !errors.any?, error_message: errors.as_json(full_messages: true)}
  end
end
