class AddAttachmentPhotoToSwimTeam < ActiveRecord::Migration
  def self.up
    add_column :swim_teams, :photo_file_name, :string
    add_column :swim_teams, :photo_content_type, :string
    add_column :swim_teams, :photo_file_size, :integer
    add_column :swim_teams, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :swim_teams, :photo_file_name
    remove_column :swim_teams, :photo_content_type
    remove_column :swim_teams, :photo_file_size
    remove_column :swim_teams, :photo_updated_at
  end
end
