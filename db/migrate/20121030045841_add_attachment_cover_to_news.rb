class AddAttachmentCoverToNews < ActiveRecord::Migration
  def self.up
    change_table :news do |t|
      t.has_attached_file :cover
    end
  end

  def self.down
    drop_attached_file :news, :cover
  end
end
