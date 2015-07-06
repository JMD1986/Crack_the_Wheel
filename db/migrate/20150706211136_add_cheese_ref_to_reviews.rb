class AddCheeseRefToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :cheese, index: true, foreign_key: true
  end
end
