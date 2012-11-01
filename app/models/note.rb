class Note < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :parent_id
  validates_presence_of :content
  
  belongs_to :user
  has_many :comments, :foreign_key => "parent_id", :class_name => "Note"
  belongs_to :community
  
  has_many :attachments
end
