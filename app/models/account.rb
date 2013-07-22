class Account < ActiveRecord::Base
  attr_accessible :account_number, :address, :city, :state, :zip

  has_many :users
end
