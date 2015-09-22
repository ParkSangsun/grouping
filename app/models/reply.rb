class Reply < ActiveRecord::Base
    # 그룹 디테일에 달린 댓글
    belongs_to :group
    # 그룹 sns에 달린 댓글
    belongs_to :post
    
    has_many :likes
end
