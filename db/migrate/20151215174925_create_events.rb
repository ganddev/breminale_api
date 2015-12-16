class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :desc
      t.string :image_url

      t.timestamps null: false
    end
  end
end
