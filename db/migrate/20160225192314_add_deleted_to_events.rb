class AddDeletedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :deleted, :boolean, :default => false
  end
end
