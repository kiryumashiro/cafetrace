class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.integer :cafedate_id

      t.timestamps
    end
  end
end
