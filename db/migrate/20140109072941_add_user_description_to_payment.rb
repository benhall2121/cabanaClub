class AddUserDescriptionToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :user_description, :string
  end
end
