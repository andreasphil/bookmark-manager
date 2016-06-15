class User < ActiveRecord::Base
  has_one :user_profile, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy
  # Include default devise modules. Others available are:
  #  :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
