class AddMilkToCheese < ActiveRecord::Migration
  def change
    add_column :cheeses, :milk, :string
  end
end
