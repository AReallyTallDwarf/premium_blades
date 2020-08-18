class CreateCatalogueblades < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogueblades do |t|
      t.references :catalogue, null: false, foreign_key: true
      t.references :blade, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
