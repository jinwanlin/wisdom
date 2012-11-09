class Hospital < ActiveRecord::Base
  attr_accessible :contact, :desc, :essence, :level, :location, :name, :openoffice, :workingtime
  
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
