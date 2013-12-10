class MeetingNote < ActiveRecord::Base
  attr_accessible :description, :meeting_id

  belongs_to :meeting
end
