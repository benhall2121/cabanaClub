class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :fname
      t.string :lname
      t.string :phone_number
      t.integer :account_id

      t.timestamps
    end
  end
end
