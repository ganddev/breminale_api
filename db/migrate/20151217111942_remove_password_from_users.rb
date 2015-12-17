class RemovePasswordFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password, :String
  end
end
