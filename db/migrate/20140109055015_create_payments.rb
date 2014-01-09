class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :stripe_id
      t.boolean :paid_by_check
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
  end
end
