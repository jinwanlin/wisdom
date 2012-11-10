class Material < ActiveRecord::Base
  attr_accessible :amount, :article_id, :name, :attachments
  
  belongs_to :article
end
