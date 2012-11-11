class Article < ActiveRecord::Base
  attr_accessible :address, :author_id, :contact, :content, :forum_id, :title, :workingtime, :attachments
  
  belongs_to :author
  belongs_to :forum
  has_many :materials
  has_many :steps
  has_many :attachments, :as => :owner
  
  def as_json(options={})
    super(:methods => [:cover, :images])
  end
  
  def cover
    if self.attachments.present?
      return Settings.base_url + attachments.first.source.url
    end
  end
  
  def images
    if self.attachments.present?
      images = []
      self.attachments.each do |attachment|
        images << {:url => Settings.base_url + attachment.source.url}
      end
    end
    return images
  end
  
end
