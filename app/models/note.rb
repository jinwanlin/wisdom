class Note < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :parent_id
  
  belongs_to :user
  has_many :comments, :foreign_key => "parent_id", :class_name => "Note"
  belongs_to :community
end
