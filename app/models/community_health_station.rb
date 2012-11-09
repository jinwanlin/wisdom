class CommunityHealthStation < ActiveRecord::Base
  attr_accessible :community_name, :contact, :desc, :essence, :location, :name, :openoffice, :workingtime, :attachments
  
  has_many :attachments, :as => :owner
end
