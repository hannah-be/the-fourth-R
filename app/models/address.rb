class Address < ApplicationRecord
  belongs_to :repairer
  
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    # [street_address, city, country.name].join(',')
    "#{street}, #{suburb}, #{state}, AUSTRALIA"
  end
end
