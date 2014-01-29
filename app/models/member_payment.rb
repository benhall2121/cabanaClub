class MemberPayment < ActiveRecord::Base
  attr_accessible :active, :cost, :name


  has_many :membershippayments
  has_many :users, :through => :membershippayments
end
