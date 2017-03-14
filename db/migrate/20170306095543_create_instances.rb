class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.string :ip_address
      t.integer :N_services
    end
  end
end
