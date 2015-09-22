class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      
      t.integer :post_id
      t.integer :group_id
      t.integer :reply_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
