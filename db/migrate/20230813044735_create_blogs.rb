class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.integer :customer_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
