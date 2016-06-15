class Bookmark < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates :title, presence: true, allow_blank: false 
  validates :url, presence: true, allow_blank: false
end
