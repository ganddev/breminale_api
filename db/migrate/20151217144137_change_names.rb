class ChangeNames < ActiveRecord::Migration
  def change
  	rename_column :locations, :longiotude, :longitude
  end
end
