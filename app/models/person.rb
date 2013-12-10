class Person < ActiveRecord::Base
  attr_accessible :name, :description, :avatar, :lifeguard, :board

  has_attached_file :avatar, :styles => { :icon => "95x65#", :small => "150>x150" },
  :default_url => "/system/avatars/default/:style/default.jpg"
end
