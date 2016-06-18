class User < ActiveRecord::Base
  has_one :user_profile, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy
  has_many :tags, :dependent => :destroy
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable
end
