# frozen_string_literal: true

class Item < ActiveRecord::Base
  has_one_attached :image
  belongs_to :user
  has_many :locations, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :locations,  allow_destroy: true, reject_if: :all_blank
end
