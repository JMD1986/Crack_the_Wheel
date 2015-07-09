class AddWheelToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :wheel, :integer
  end
end
