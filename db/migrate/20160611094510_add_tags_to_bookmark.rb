class AddTagsToBookmark < ActiveRecord::Migration
  def change
    create_join_table :bookmarks, :tags
  end
end
