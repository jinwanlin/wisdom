class Step < ActiveRecord::Base
  attr_accessible :article_id, :desc, :position, :attachments
  
  belongs_to :article
  has_many :attachments, :as => :owner
end
