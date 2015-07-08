class AddAttachmentImageToCheeses < ActiveRecord::Migration
  def self.up
    change_table :cheeses do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :cheeses, :image
  end
end
