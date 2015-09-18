class Membership < ActiveRecord::Base
  validates_uniqueness_of :user_id, :scope => :group_id
  # group_id 하나에 user_id아이디가 유일한지 검사하고 중복되면 아예 가입이 되지 않게 함
  belongs_to :user
  belongs_to :group
end
