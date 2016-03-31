class RemoveBreminaleDateIdFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :breminale_date_id, :integer
  end
end
