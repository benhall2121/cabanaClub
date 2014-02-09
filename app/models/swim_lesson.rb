class SwimLesson < ActiveRecord::Base
  attr_accessible :active, :description, :end_age, :end_date, :end_time, :fri, :mon, :name, :num_allowed_participants, :price_per_participant, :sat, :start_age, :start_date, :start_time, :sun, :thurs, :tues, :wed, :photo

  has_attached_file :photo, :styles => { :icon => "95x65#", :small => "150>x150" },
  :url  => "/system/swim_lessons/:id/:style/:basename.:extension",
  :default_url => "/system/swim_lessons/default/:style/default.jpg"

  has_many :userswimlessons
  has_many :users, :through => :userswimlessons
end
