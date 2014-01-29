class CreateMembershippayments < ActiveRecord::Migration
  def change
    create_table :membershippayments do |t|
      t.integer :user_id
      t.integer :member_payment_id

      t.timestamps
    end
  end
end
