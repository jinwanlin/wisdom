class Article < ActiveRecord::Base
  attr_accessible :address, :author_id, :contact, :content, :forum_id, :title, :workingtime, :attachments
  
  belongs_to :author
  belongs_to :forum
  has_many :materials
  has_many :steps
  has_many :attachments, :as => :owner
end
