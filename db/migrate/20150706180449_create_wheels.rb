class CreateWheels < ActiveRecord::Migration
  def change
    create_table :wheels do |t|
      t.boolean :like

      t.timestamps null: false
    end
  end
end
