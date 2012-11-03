class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :community_id, :sina_id
  # attr_accessible :title, :body
  
  before_save :ensure_authentication_token
  
  belongs_to :community
  
  has_many :notes
  
  def as_json(options={})
    super(:only => [:id, :community_id, :sina_id, :email, :updated_at])
  end
  
end
