class Payment < ActiveRecord::Base
  attr_accessible :amount, :paid_by_check, :stripe_id, :account_id, :user_id, :user_description

  belongs_to :user
  belongs_to :account

  def save_with_payment
    if valid?
      charge = Stripe::Charge.create(:amount => (amount*100).to_i, # in cents
    	:currency => "usd",
    	:description => account.address + " :: " + user.customer_stripe_token + " :: " + user_description,
    	:card => stripe_id
	  )

      self.stripe_id = charge.id
      save!
    end
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      puts "message :: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
    end
end
