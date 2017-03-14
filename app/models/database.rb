class Database < ActiveRecord::Base
  validates_presence_of :db_id
 
  validates :db_id, uniqueness: {}

  def self.create(database)
    database = Database.new database
    res = database.save
    {success: res, database: database}
  end

  def update(database)
    database.slice!("db_id", "type", "N_tables")
    database.each do |key, value|
      send("#{key}=", value)
    end
    save
    return {success: !errors.any?, error_message: errors.as_json(full_messages: true)}
  end
end
