# encoding: utf-8

class Merchant < ActiveRecord::Base
  attr_accessible :app_type, :contact, :desc, :location, :name, :position, :service_type, :title, :v_type
  
  has_many :attachments, :as => :owner
  
  HOME_SERVICE_TYPE = %w("搬家公司", "保洁清洗", "家电维修", "月嫂服务", "生活配送", "鲜花速递", "洗衣店")
  
  NEAR_SERVICE_TYPE = %w("美食", "休闲娱乐", "酒店", "银行", 加油站", "医院", "商场", "超市")
  
  
end
 