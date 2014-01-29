class AddColumnToMembershippayment < ActiveRecord::Migration
  def change
    add_column :membershippayments, :payment_id, :integer
  end
end
