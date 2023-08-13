class CreateCafedates < ActiveRecord::Migration[6.1]
  def change
    create_table :cafedates do |t|
      t.integer :pin_type
      t.string :name
      t.float :longitude
      t.float :latitude
      t.text :desctiption

      t.timestamps
    end
  end
end
