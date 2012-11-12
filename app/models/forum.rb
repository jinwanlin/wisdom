# encoding: utf-8
class Forum < ActiveRecord::Base
  attr_accessible :name, :need_type, :position, :attachments
  
  has_many :articles
  has_many :attachments, :as => :owner
  
  NEED_TYPE = %w(制作步骤)
  
  def as_json(options={})
    super(:methods => [:cover])
  end
  
  def cover
    if self.attachments.present?
      return Settings.base_url + attachments.last.source.url
    end
  end
  
end
