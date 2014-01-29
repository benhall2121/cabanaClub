class AddPageUrlToStaticpage < ActiveRecord::Migration
  def change
    add_column :staticpages, :page_url, :string
  end
end
