class Item < ApplicationRecord
  include PhotoUploader.attachment(:photo)  

  belongs_to :user
end
