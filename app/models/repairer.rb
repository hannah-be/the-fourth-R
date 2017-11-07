class Repairer < ApplicationRecord
  include PhotoUploader.attachment(:photo) 

  belongs_to :user
  has_one :address, through: :user
  accepts_nested_attributes_for :address

end
