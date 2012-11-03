class Note < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :parent_id, :community_id
  validates_presence_of :content
  
  belongs_to :user
  has_many :comments, :foreign_key => "parent_id"
  
  belongs_to :community
  
  has_many :attachments
  
  def as_json(options={})
    super(:only => [:id, :user_id, :community_id, :content, :created_at], 
          :include => {:comments => {:only => [:id, :user_id, :community_id, :content, :created_at]}},
          :methods => [:image])
  end
  
  def image
    Settings.base_url + self.attachments.first.source.url unless self.attachments.blank?
  end
end
