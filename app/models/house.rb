# encoding: utf-8
class House < ActiveRecord::Base
  attr_accessible :contact, :cover, :desc, :location, :name, :service_type, :title, :v_type
  
  has_many :attachments, :as => :owner, :dependent => :destroy
  
  SERVICE_TYPE = %w(搬家公司 保洁清洗 家电维修 月嫂服务 生活配送 鲜花速递 洗衣店)
  
end
