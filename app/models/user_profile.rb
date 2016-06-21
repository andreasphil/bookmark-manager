class UserProfile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :background_image, BackgroundUploader
end
