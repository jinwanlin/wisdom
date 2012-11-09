# encoding: utf-8
class Repository < ActiveRecord::Base
  attr_accessible :base_type, :category, :content, :content_url, :title
  REPOSITORY_TYPE = %w(健康 阳光政务 个人办事 人劳社保 常见问题)
  
end
