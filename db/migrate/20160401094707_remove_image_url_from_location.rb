class RemoveImageUrlFromLocation < ActiveRecord::Migration
  def change
  	remove_column :locations, :image_url, :string
  end
end
