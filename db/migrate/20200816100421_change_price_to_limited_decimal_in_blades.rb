class ChangePriceToLimitedDecimalInBlades < ActiveRecord::Migration[6.0]
  def change
    change_column :blades, :price, :decimal, :precision => 8, :scale => 2
  end

  def down
    change_column :blades, :price, :float
  end
end
