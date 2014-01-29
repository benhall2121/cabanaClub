class Userswimteam < ActiveRecord::Base
  attr_accessible :payment_id, :swim_team_id, :user_id


  belongs_to :user
  belongs_to :swim_team
end
