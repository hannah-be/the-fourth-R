class Profile < ApplicationRecord
  include PhotoUploader.attachment(:photo) 

  belongs_to :user
  has_many :items, dependent: :destroy
  
end
