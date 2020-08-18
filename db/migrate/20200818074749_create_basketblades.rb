class CreateBasketblades < ActiveRecord::Migration[6.0]
  def change
    create_table :basketblades do |t|
      t.references :basket, null: false, foreign_key: true
      t.references :blade, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
