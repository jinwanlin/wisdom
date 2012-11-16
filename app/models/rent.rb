# encoding: utf-8

class Rent < ActiveRecord::Base
  attr_accessible :area, :build_time, :community_id, :contact, :contact_people, :decoration, :desc, :fitment, :floor, :live_time, :live_type, :location, :near, :orientation, :price, :rent_type, :shape, :show_time, :title, :traffic, :people_type, :attachments
  
  belongs_to :community
  has_many :attachments, :as => :owner
  
  RENT_TYPE = %w(出租 求租)
  LIVE_TYPE = %w(整租 合租)
  PEOPLE_TYPE = %w(个人 中介)
  
  def as_json(options={})
     super(:methods => [:cover, :images])
   end

   def cover
     if self.attachments.present?
       return Settings.base_url + attachments.first.source.url(:medium)
     end
   end

   def images
     if self.attachments.present?
       images = []
       self.attachments.each do |attachment|
         images << {:url => Settings.base_url + attachment.source.url, :url_thumb => Settings.base_url + attachment.source.url(:thumb) }
       end
     end
     return images
   end
end
