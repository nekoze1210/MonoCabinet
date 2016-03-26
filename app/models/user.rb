class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  has_many :items
  has_many :locations

  validates :nickname,
    uniqueness: { case_sensitive: :false },
    length: { minimum: 4, maximum: 20 }


  # has_attached_file :avatar,
  #                                     styles:  { medium: "300x300#", thumb: "100x100#" }
  # validates_attachment_content_type :avatar,
  #                                     content_type: ["image/jpg","image/jpeg","image/png"]

end
