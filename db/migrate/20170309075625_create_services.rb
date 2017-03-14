class CreateServices < ActiveRecord::Migration
  def change
  	create_table :services do |t|
      t.string :process_id
      t.string :service_name
      t.string :language
      t.string :status
      t.date :last_update
    end
  end
end
