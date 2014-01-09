class Account < ActiveRecord::Base
  attr_accessible :account_number, :address, :city, :state, :zip

  has_many :users
  has_many :payments

  def self.search(search)
	if search
	  where('address LIKE ?', "%#{search}%")
	else
	  scoped
	end
  end
end
