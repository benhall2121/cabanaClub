class Userswimlesson < ActiveRecord::Base
  attr_accessible :payment_id, :swim_lesson_id, :user_id

  belongs_to :user
  belongs_to :swim_lesson
end
