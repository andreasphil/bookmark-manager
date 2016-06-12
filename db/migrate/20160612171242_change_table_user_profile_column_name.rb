class ChangeTableUserProfileColumnName < ActiveRecord::Migration
  def change
    rename_column :user_profiles, :backgound_image, :background_image
  end
end
