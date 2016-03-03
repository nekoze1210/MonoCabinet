class Item < ActiveRecord::Base
reverse_geocoded_by :latitude, :longitude
after_validation :reverse_geocode

validates_presence_of :item_name, :maker, :image_url
end
