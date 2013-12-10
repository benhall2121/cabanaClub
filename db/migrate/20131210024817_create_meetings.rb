class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.text :description
      t.date :meeting_date

      t.timestamps
    end
  end
end
