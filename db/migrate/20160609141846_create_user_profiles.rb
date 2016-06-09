class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.text :backgound_image
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
