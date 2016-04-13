class AddSoundCloudUserIdToEvents < ActiveRecord::Migration
 def change
    add_column :events, :soundcloud_user_id, :string
  end
end
