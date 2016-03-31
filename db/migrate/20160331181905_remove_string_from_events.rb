class RemoveStringFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :String, :string
  end
end
