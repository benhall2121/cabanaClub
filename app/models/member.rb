class Member < ActiveRecord::Base
  attr_accessible :birthdate, :gender, :name, :user_id
end
