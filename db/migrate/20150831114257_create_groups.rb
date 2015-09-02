class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      
      t.string :group_name
      t.integer :group_max
      t.string :group_region
      t.string :group_interest
      t.text :group_content
      t.string :group_founder
      t.integer :group_like
      t.string :group_member

      t.timestamps null: false
    end
  end
end
