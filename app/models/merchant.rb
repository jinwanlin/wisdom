# encoding: utf-8

class Merchant < ActiveRecord::Base
  attr_accessible :app_type, :contact, :desc, :location, :name, :position, :service_type, :title, :v_type
  
  has_many :attachments, :as => :owner
  
  NEAR_SERVICE_TYPE = %w(超市 电影院 美食 休闲娱乐 生活服务)
  
end
 