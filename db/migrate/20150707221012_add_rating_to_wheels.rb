class AddRatingToWheels < ActiveRecord::Migration
  def change
    add_column :wheels, :rating, :integer
  end
end
