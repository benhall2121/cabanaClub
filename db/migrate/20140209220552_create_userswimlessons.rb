class CreateUserswimlessons < ActiveRecord::Migration
  def change
    create_table :userswimlessons do |t|
      t.integer :user_id
      t.integer :swim_lesson_id
      t.integer :payment_id

      t.timestamps
    end
  end
end
