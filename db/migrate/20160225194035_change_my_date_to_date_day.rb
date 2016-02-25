class ChangeMyDateToDateDay < ActiveRecord::Migration
  def change
  	rename_column :breminale_dates, :my_date, :date_day
  end
end
