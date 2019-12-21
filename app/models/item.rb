# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image

  has_many :locations, dependent: :destroy

  belongs_to :user

  validates :item_name, presence: true

  accepts_nested_attributes_for :locations, allow_destroy: true, reject_if: :all_blank
end
