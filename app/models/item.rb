class Item < ApplicationRecord
  include PhotoUploader.attachment(:photo)
  validates :title, presence: true

  belongs_to :user
  has_one :address, through: :user

  geocoded_by :address
  after_validation :geocode

end
