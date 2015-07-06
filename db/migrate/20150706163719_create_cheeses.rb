class CreateCheeses < ActiveRecord::Migration
  def change
    create_table :cheeses do |t|
      t.string :name
      t.string :family, null: false
      t.string :style, null: false
      t.string :origin

      t.timestamps null: false
    end
  end
end
