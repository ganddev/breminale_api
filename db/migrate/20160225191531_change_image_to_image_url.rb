class ChangeImageToImageUrl < ActiveRecord::Migration
  def change
  	rename_column :locations, :image, :image_url
  end
end
