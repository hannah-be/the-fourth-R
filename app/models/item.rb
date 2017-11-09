class Item < ApplicationRecord
  include PhotoUploader.attachment(:photo)  

  belongs_to :user
  has_one :address
  accepts_nested_attributes_for :address
  has_one :repair
  has_one :repairer, through: :repair
  
end
