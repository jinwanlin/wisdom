class News < ActiveRecord::Base
  attr_accessible :content, :title, :cover
  
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                            :default_url => "/assets/default.jpeg"
  
  self.per_page = 18
  
  def as_json(options={})
    super(:only => [:id, :title, :content, :created_at], :methods => [:image])
  end
  
  def image
    Settings.base_url + self.cover.url
  end
end
