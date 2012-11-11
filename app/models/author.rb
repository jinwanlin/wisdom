class Author < ActiveRecord::Base
  attr_accessible :age, :contact, :desc, :name, :sex, :attachments
  
  has_many :articles
  has_many :attachments, :as => :owner
  
  def as_json(options={})
    super(:methods => [:cover])
  end
  
  def cover
    if self.attachments.present?
      return Settings.base_url + attachments.first.source.url
    end
  end
end
