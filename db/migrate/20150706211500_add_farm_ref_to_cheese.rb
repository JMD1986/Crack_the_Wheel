class AddFarmRefToCheese < ActiveRecord::Migration
  def change
    add_reference :cheeses, :farm, index: true, foreign_key: true
  end
end
