class Sirelations < ActiveRecord::Migration
  def change
  	 create_table :sirelations do |t|
      t.string :ip_address
      t.string :service_name
    end
  end
end
