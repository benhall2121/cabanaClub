class SwimTeam < ActiveRecord::Base
  attr_accessible :description, :end_age, :end_date, :name, :num_allowed_participants, :price_per_participant, :start_age, :start_date, :active, :start_time, :end_time, :mon, :tues, :wed, :thurs, :fri, :sat, :sun, :photo

  has_attached_file :photo, :styles => { :icon => "95x65#", :small => "150>x150" },
  :default_url => "/system/photos/default/:style/default.jpg"

  has_many :userswimteams
  has_many :users, :through => :userswimteams
end
