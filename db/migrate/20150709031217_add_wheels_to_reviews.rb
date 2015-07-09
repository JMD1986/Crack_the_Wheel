class AddWheelsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :wheels, :integer
  end
end
