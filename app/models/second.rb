class Second < ActiveRecord::Base
  attr_accessible :desc, :owner, :price, :rate, :title, :views
  
  has_many :attachments, :as => :owner
end
