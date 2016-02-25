class ChangeDescToDescriptionEvents < ActiveRecord::Migration
  def change
  	rename_column :events, :desc, :description
  end
end
