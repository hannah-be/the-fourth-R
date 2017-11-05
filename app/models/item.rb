class Item < ApplicationRecord
  include PhotoUploader.attachment(:photo)  
end
