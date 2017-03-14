class Sdrelations < ActiveRecord::Migration
  def change
  	 create_table :sdrelations do |t|
      t.string :db_id
      t.string :service_name
    end
  end
end
