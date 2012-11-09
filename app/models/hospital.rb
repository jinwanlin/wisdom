class Hospital < ActiveRecord::Base
  attr_accessible :contact, :desc, :essence, :level, :location, :name, :openoffice, :workingtime
  
  has_many :attachments, :as => :owner
  
end
