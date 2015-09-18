class Group < ActiveRecord::Base
    has_many :replies
    has_many :posts
    
    has_many :memberships, -> { where.not(memberships: { accepted_on: nil}) }
    has_many :users, :through => :memberships
    
end
