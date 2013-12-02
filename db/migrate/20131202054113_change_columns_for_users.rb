class ChangeColumnsForUsers < ActiveRecord::Migration
  def up
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
    add_column :users, :super_admin, :boolean

    remove_column :users, :account_admin
  end

  def down
    remove_column :users, :address
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip_code
    remove_column :users, :super_admin

    add_column :users, :account_admin, :boolean
  end
end
