class Item < ActiveRecord::Base
mount_uploader :image, ImageUploader
# validates_presence_of :item_name, :maker

belongs_to :user

has_many :locations
accepts_nested_attributes_for :locations
end
