class AddBioToFarm < ActiveRecord::Migration
  def change
    add_column :farms, :bio, :text
  end
end
