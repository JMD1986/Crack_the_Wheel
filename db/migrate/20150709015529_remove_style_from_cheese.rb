class RemoveStyleFromCheese < ActiveRecord::Migration
  def change
    remove_column :cheeses, :style, :string
  end
end
