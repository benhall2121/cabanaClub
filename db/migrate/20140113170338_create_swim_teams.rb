class CreateSwimTeams < ActiveRecord::Migration
  def change
    create_table :swim_teams do |t|
      t.string :name
      t.text :description
      t.integer :start_age
      t.integer :end_age
      t.date :start_date
      t.date :end_date
      t.integer :num_allowed_participants
      t.float :price_per_participant
      t.boolean :active

      t.timestamps
    end
  end
end
