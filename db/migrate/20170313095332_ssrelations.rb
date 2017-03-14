class Ssrelations < ActiveRecord::Migration
  def change
  	 create_table :ssrelations do |t|
      t.string :sender_s
      t.string :receiver_s
      t.string :protocol
    end
  end
end
