class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :mail
      t.string :password
      t.string :encrypted_password
      t.string :phone
      t.string :address
      t.string :locale
      t.string :status
      t.timestamps null: false
    end
  end
end
