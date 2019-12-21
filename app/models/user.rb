# frozen_string_literal: true

class User < ActiveRecord::Base
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items

  validates :nickname,
            uniqueness: { case_sensitive: :false },
            length: { minimum: 4, maximum: 20 }
end
