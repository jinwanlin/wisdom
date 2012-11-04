class Attachment < ActiveRecord::Base
  attr_accessible :owner_id, :owner_type, :source
  
  belongs_to :owner, :polymorphic => true
  
  has_attached_file :source, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def as_json(options={})
    # super(:only => [:id, :source_file_name, :created_at], :methods => [:thumb_url, :origin_url])
    super(:only => [:id])
  end
  
  def thumb_url
    Settings.base_url + self.source.url(:thumb)
  end
  
  def origin_url
    Settings.base_url + self.source.url
  end
end
