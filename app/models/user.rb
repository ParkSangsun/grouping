class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         validates_uniqueness_of :nickname
  
  mount_uploader :profile_img, ProfileUploader

  
  # 가입 신청 제한 accpted on이 nil이 아닌 것들만 유저의 멤버십으로 들어갈 수 있음
  has_many :memberships, -> { where.not(memberships: { accepted_on: nil}) }
  # 위의 멤버십을 통해 group들이 user에게 할당됨
  has_many :groups, :through => :memberships
  
  belongs_to :like
  #profile img upload

         
end
