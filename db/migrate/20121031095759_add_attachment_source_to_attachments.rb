class AddAttachmentSourceToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.has_attached_file :source
    end
  end

  def self.down
    drop_attached_file :attachments, :source
  end
end
