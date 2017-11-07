class Address < ApplicationRecord
  belongs_to :user
  has_one :address, through: :user
end
