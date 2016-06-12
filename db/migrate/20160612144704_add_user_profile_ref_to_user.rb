class AddUserProfileRefToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_profile, :reference
  end
end
