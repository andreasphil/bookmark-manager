class RemoveRefUserIdFromUserProfile < ActiveRecord::Migration
  def change
    remove_reference :user_profiles, :user_id, index: true, foreign_key: true
  end
end
