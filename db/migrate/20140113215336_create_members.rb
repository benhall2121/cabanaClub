class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.date :birthdate
      t.boolean :gender
      t.integer :user_id

      t.timestamps
    end
  end
end
