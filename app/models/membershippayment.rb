class Membershippayment < ActiveRecord::Base
  attr_accessible :member_payment_id, :user_id, :payment_id

  belongs_to :user
  belongs_to :member_payment
end
