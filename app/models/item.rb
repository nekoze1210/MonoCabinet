class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :locations
  accepts_nested_attributes_for :locations,  allow_destroy: true, reject_if: :all_blank
  # validates_presence_of :item_name, :maker
  # バリデーションを掛けたいけどエラーが表示されない
end
