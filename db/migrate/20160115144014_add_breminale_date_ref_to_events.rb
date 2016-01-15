class AddBreminaleDateRefToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :breminale_date, index: true, foreign_key: true
  end
end
