class RemoveBreminaleDates < ActiveRecord::Migration
  def change
  	drop_table :breminale_dates
  end
end
