class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_token
      t.string :device_type
      t.string :device_id

      t.timestamps null: false
    end
  end
end
