class CreateCafedates < ActiveRecord::Migration[6.1]
  def change
    create_table :cafedates do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :pin_type
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.text :desctiption

      t.timestamps
    end
  end
end
