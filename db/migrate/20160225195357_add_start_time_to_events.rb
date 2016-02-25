class AddStartTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_time, :Date
  end
end
