class Tag < ActiveRecord::Base
  has_and_belongs_to_many :bookmarks
  belongs_to :user
  validates :title, presence: true, uniqueness: true, allow_blank: false
end
