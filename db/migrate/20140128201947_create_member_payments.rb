class CreateMemberPayments < ActiveRecord::Migration
  def change
    create_table :member_payments do |t|
      t.string :name
      t.float :cost
      t.boolean :active

      t.timestamps
    end
  end
end
