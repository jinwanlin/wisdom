class Note < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :parent_id, :community_id, :children_count, :attachment
  validates_presence_of :content
  
  belongs_to :user
  has_many :comments, :foreign_key => "parent_id"
  
  belongs_to :community
  
  has_many :attachments, :as => :owner
  
  def as_json(options={})
    super(:only => [:id, :community_id, :content, :children_count, :created_at], :methods => [:image, :user_info])
  end

  
  def image
    Settings.base_url + self.attachments.first.source.url unless self.attachments.blank?
  end
  
  def user_info
    # self.user.as_json
    user = User.find_by_id self.user_id
    unless user.blank?
      {:avatar => user.avatar, :name => user.name}
    end
  end
end
