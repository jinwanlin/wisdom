class Coupon < ActiveRecord::Base
  attr_accessible  :title, :category, :cover, :desc, :expire, :merchant_name, :merchant_contact, :merchant_address
  
  has_many :attachments, :as => :owner
  
  def as_json(options={})
    super(:only => [:id, :merchant_name, :merchant_contact, :merchant_address, :title, :desc, :expire], :methods => [:image])
  end
  
  def image
    Settings.base_url + self.attachments.first.source.url unless self.attachments.blank?
  end
end
