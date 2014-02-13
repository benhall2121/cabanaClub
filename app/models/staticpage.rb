class Staticpage < ActiveRecord::Base
  attr_accessible :page_body, :page_name, :page_title, :page_url, :static_page_photo

  has_attached_file :static_page_photo, :styles => { :icon => "95x65#", :small => "150>x150", :medium => "300>x300", :large => "450>x450" },
  :url  => "/system/static_pages/:id/:style/:basename.:extension",
  :default_url => "/system/static_pages/default/:style/default.jpg"
end
