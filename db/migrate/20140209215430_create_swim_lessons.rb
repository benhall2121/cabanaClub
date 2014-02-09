class CreateSwimLessons < ActiveRecord::Migration
  def change
    create_table :swim_lessons do |t|
      t.string :name
      t.text :description
      t.integer :start_age
      t.integer :end_age
      t.datetime :start_date
      t.datetime :end_date
      t.integer :num_allowed_participants
      t.float :price_per_participant
      t.boolean :active
      t.time :start_time
      t.time :end_time
      t.boolean :mon
      t.boolean :tues
      t.boolean :wed
      t.boolean :thurs
      t.boolean :fri
      t.boolean :sat
      t.boolean :sun

      t.timestamps
    end
  end
end
