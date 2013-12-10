class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :description
      t.boolean :lifeguard, :default => false
      t.boolean :board, :default => false

      t.timestamps
    end
  end
end
