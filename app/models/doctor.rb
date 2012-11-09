class Doctor < ActiveRecord::Base
  attr_accessible :age, :desc, :hostpital, :level, :major, :name, :office, :out_call, :sex, :attachments
  
  has_many :attachments, :as => :owner
  
  def as_json(options={})
    super(:methods => [:image])
  end
  
  def image
    Settings.base_url + self.attachments.first.source.url unless self.attachments.blank?
  end
end
