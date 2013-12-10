class CreateMeetingNotes < ActiveRecord::Migration
  def change
    create_table :meeting_notes do |t|
      t.string :description

      t.timestamps
    end
  end
end
