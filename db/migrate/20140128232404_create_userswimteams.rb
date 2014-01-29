class CreateUserswimteams < ActiveRecord::Migration
  def change
    create_table :userswimteams do |t|
      t.integer :user_id
      t.integer :swim_team_id
      t.integer :payment_id

      t.timestamps
    end
  end
end
