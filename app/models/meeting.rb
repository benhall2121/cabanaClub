class Meeting < ActiveRecord::Base
  attr_accessible :description, :meeting_date, :title

  has_many :meeting_notes, :dependent => :destroy

  def meeting_name_date
  	return "#{self.meeting_date.strftime("%B %Y") if !self.meeting_date.nil?} - #{self.title}"
  end
end
