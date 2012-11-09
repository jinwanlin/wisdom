class Doctor < ActiveRecord::Base
  attr_accessible :age, :desc, :hostpital, :level, :major, :name, :office, :out_call, :sex, :attachments
  
  has_many :attachments, :as => :owner
end
