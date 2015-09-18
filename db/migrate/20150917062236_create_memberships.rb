class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      
      t.integer :group_id
      t.string :group_name
      t.integer :user_id
      t.string :apply_nickname
      t.text :apply_introduce
      t.datetime :accepted_on

      t.timestamps null: false
    end
  end
end
