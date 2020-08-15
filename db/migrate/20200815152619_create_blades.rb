class CreateBlades < ActiveRecord::Migration[6.0]
  def change
    create_table :blades do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :pointy
      t.integer :stock

      t.timestamps
    end
  end
end
