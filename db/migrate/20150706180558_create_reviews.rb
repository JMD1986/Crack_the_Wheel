class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name_of_cheese
      t.text :commentary

      t.timestamps null: false
    end
  end
end
