class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :description
      t.decimal :latitude
      t.decimal :longiotude
      t.boolean :deleted
      t.belongs_to :user, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
