class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      
      t.integer :group_id
      #group_id 에서 상위(엄마)의 아이디를 찾기위해서 추가한 항목. 반드시 상위DB이름_id의 형태여야함!예약어!
      t.integer :post_id
      t.string :reply_username
      t.string :reply_content

      t.timestamps null: false
    end
  end
end
