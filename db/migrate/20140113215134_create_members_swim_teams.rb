class CreateMembersSwimTeams < ActiveRecord::Migration
  def change
    create_table :members_swim_teams do |t|
      t.integer :swim_team_id
      t.integer :member_id
      t.integer :payment_id

      t.timestamps
    end
  end
end
