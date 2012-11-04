class AddPolymorphicToAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :note_id
    
    add_column :attachments, :owner_id, :integer
    add_column :attachments, :owner_type, :string
    
  end
  
  
  
end