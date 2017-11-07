class Profile < ApplicationRecord
  include PhotoUploader.attachment(:photo) 

  belongs_to :user
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
end
