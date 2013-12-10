class AddMeetingIdToMeetings < ActiveRecord::Migration
  def change
    add_column :meeting_notes, :meeting_id, :integer
  end
end
