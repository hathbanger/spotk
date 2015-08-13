class AddAttachmentImageToTricks < ActiveRecord::Migration
  def self.up
    change_table :tricks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tricks, :image
  end
end
