class Location < ActiveRecord::Base
  require 'geocoder'
  Geocoder.configure(:language  => :ja,  :units => :km, :lookup => :google) # 設定
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  validates :latitude, presence: true
  validates :longitude, presence: true
  belongs_to :item
  belongs_to :user
end
