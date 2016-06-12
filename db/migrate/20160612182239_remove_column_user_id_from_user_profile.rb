class RemoveColumnUserIdFromUserProfile < ActiveRecord::Migration
  def self.up
    remove_column :user_profiles, :user_id
  end

  def self.down
    add_column :user_profiles, :user_id, :integer
end
