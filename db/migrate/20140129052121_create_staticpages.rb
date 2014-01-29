class CreateStaticpages < ActiveRecord::Migration
  def change
    create_table :staticpages do |t|
      t.string :page_name
      t.string :page_title
      t.text :page_body

      t.timestamps
    end
  end
end
