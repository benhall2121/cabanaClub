class Staticpage < ActiveRecord::Base
  attr_accessible :page_body, :page_name, :page_title, :page_url
end
