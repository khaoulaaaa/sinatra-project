class Dependencies < ActiveRecord::Migration
  def change
  	 create_table :dependencies do |t|
      t.string :file_name
      t.string :file_type
      t.string :service_name
    end
  end
end
