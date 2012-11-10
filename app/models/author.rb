class Author < ActiveRecord::Base
  attr_accessible :age, :contact, :desc, :name, :sex, :attachments
  
  has_many :articles
  has_many :attachments, :as => :owner
end
