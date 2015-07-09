class AddAgeToCheese < ActiveRecord::Migration
  def change
    add_column :cheeses, :age, :string
  end
end
