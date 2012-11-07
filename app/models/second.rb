class Second < ActiveRecord::Base
  attr_accessible :desc, :owner, :price, :rate, :title, :views, :contact
  
  has_many :attachments, :as => :owner
end
