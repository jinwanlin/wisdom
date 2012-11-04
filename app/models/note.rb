class Note < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :parent_id, :community_id, :children_count
  validates_presence_of :content
  
  belongs_to :user
  has_many :comments, :foreign_key => "parent_id"
  
  belongs_to :community
  
  has_many :attachments
  
  def as_json(options={})
    super(:only => [:id, :user_id, :community_id, :content, :children_count, :created_at], :methods => [:image])
  end

  
  def image
    Settings.base_url + self.attachments.first.source.url unless self.attachments.blank?
  end
end
