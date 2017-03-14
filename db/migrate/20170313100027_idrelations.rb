class Idrelations < ActiveRecord::Migration
  def change
  	 create_table :idrelations do |t|
      t.string :ip_address
      t.string :db_id
    end
  end
end
