class Community < ActiveRecord::Base
  attr_accessible :desc, :location, :name, :score
  
  has_many :user_communities
  has_many :users, :through => :user_communities
  
  has_many :notes
end
