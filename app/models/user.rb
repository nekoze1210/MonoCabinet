# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_attached :avatar

  has_many :items

  validates :nickname,
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 20 }
end
