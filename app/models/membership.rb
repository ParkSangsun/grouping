class Membership < ActiveRecord::Base
  # group_id 하나에 user_id아이디가 유일한지 검사하고 중복되면 아예 가입이 되지 않게 함(아직 alert는 구현 안함)
  validates_uniqueness_of :user_id, :scope => :group_id
  
  # Membership은 user와 group 모두에 속해 있음 => 유저는 여러개의 그룹에 가입신청, 그룹은 여러명의 가입신청 된 유저를 가짐
  belongs_to :user
  belongs_to :group
end
