class AddSoundcloudUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :soundcloud_url, :string
    add_column :events, :String, :string
  end
end
