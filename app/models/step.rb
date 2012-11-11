class Step < ActiveRecord::Base
  attr_accessible :article_id, :desc, :position, :attachments
  
  belongs_to :article
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
