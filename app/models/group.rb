class Group < ActiveRecord::Base
    has_many :replies
    has_many :posts
end
