class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      
      # 신청한 그룹의 정보
      t.integer :group_id
      t.string :group_name
      
      # 신청한 user의 정보
      t.integer :user_id
      t.string :apply_nickname
      
      # 가입 신청 인삿말
      t.text :apply_introduce
      
      # 가입 승인 attribute 가입 신청시엔 nil, 승인과 동시에 Datetime.now로 갱신
      t.datetime :accepted_on

      t.timestamps null: false
    end
  end
end
