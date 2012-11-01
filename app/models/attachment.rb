class Attachment < ActiveRecord::Base
  attr_accessible :note_id, :source
  
  belongs_to :note
  
  has_attached_file :source, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
