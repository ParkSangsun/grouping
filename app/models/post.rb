class Post < ActiveRecord::Base
    # 그룹 SNS 글
    belongs_to :group
    has_many :replies
    has_many :likes
end
