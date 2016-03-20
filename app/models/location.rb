class Location < ActiveRecord::Base
require 'geocoder'
Geocoder.configure(:language  => :ja,  :units => :km, :lookup => :google) # 設定
reverse_geocoded_by :latitude, :longitude
after_validation :reverse_geocode


  belongs_to :item
end
