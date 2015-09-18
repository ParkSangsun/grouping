class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         validates_uniqueness_of :nickname
  
  has_many :memberships, -> { where.not(memberships: { accepted_on: nil}) }
  has_many :groups, :through => :memberships
  
         
end
