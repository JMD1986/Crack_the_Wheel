class AddUserRefToWheels < ActiveRecord::Migration
  def change
    add_reference :wheels, :user, index: true, foreign_key: true
  end
end
