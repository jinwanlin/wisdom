# encoding: utf-8
class Forum < ActiveRecord::Base
  attr_accessible :name, :need_type, :position, :attachments
  
  has_many :articles
  has_many :attachments, :as => :owner
  
  NEED_TYPE = %w(制作步骤)
end
