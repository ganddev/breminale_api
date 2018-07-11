class AddDefaultValueToDeletedInLocations < ActiveRecord::Migration
  def change
  	change_column :locations, :deleted, :boolean, :default => false
  end
end
