class CreateDatabases < ActiveRecord::Migration
 def change
    create_table :databases do |t|
      t.string :db_id
      t.string :type
      t.integer :N_tables
    end
  end
end
