class UserCommunity < ActiveRecord::Base
  attr_accessible :community_id, :user_id
  belongs_to :user
  belongs_to :community
end
