class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :group
  belongs_to :reply
  has_many :users
end
