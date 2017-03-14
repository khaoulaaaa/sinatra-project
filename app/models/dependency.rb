class Dependency < ActiveRecord::Base
  validates_presence_of :file_name
  validates_presence_of :service_name
  validates :file_name, uniqueness: {}

  def self.create(dependency)
    dependency = Dependency.new dependency
    res = dependency.save
    {success: res, dependency: dependency}
  end

  def update(dependency)
    dependency.slice!("file_name", "service_name", "file_type")
    dependency.each do |key, value|
      send("#{key}=", value)
    end
    save
    return {success: !errors.any?, error_message: errors.as_json(full_messages: true)}
  end
end
