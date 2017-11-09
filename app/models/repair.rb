class Repair < ApplicationRecord
  belongs_to :item
  belongs_to :repairer

  accepts_nested_attributes_for :repairer
end
