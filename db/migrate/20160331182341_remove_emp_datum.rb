class RemoveEmpDatum < ActiveRecord::Migration
  def change
  	drop_table :emp_data
  end
end
