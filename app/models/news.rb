class News < ActiveRecord::Base
  attr_accessible :content, :title, :attachment
  
  has_many :attachments, :as => :owner
  
  def as_json(options={})
    super(:only => [:id, :title, :content, :created_at], :methods => [:image])
  end

  
  def image
    if self.attachments.present?
      Settings.base_url + self.attachments.first.source.url
    end
  end
end
