class AddTimeAndDaysToSwimTeam < ActiveRecord::Migration
  def change
    add_column :swim_teams, :start_time, :time
    add_column :swim_teams, :end_time, :time
    add_column :swim_teams, :mon, :boolean
    add_column :swim_teams, :tues, :boolean
    add_column :swim_teams, :wed, :boolean
    add_column :swim_teams, :thurs, :boolean
    add_column :swim_teams, :fri, :boolean
    add_column :swim_teams, :sat, :boolean
    add_column :swim_teams, :sun, :boolean
  end
end
