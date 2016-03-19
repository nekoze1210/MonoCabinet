class Item < ActiveRecord::Base
require 'geocoder'
Geocoder.configure(:language  => :ja,  :units => :km, :lookup => :google) # 設定
reverse_geocoded_by :latitude, :longitude
after_validation :reverse_geocode
mount_uploader :image, ImageUploader

validates_presence_of :item_name, :maker

belongs_to :user
has_many :locations
end
