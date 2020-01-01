# frozen_string_literal: true

class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :locations, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :locations,  allow_destroy: true, reject_if: :all_blank
end
