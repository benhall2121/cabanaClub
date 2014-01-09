class AddCustomerStripeTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :customer_stripe_token, :string
  end
end
