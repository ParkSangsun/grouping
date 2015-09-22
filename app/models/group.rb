class Group < ActiveRecord::Base
    # 그룹 detail페이지에 달린 reply
    has_many :replies
    # 그룹 sns 글
    has_many :posts
    # 가입 신청 제한 accpted on이 nil이 아닌 것들만 그룹의 멤버십으로 들어갈 수 있음
    has_many :memberships, -> { where.not(memberships: { accepted_on: nil}) }
    # 위의 멤버십을 통해 user들이 group에 할당됨
    has_many :users, :through => :memberships
    has_many :likes
end
