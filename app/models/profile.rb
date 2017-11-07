class Profile < ApplicationRecord
  include PhotoUploader.attachment(:photo) 

  belongs_to :user
  has_one :address
  accepts_nested_attributes_for :address, update_only: true

  geocoded_by :address
  after_validation :geocode
end
