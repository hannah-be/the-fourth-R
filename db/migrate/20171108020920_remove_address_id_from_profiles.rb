class RemoveAddressIdFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_reference :profiles, :address, foreign_key: true
  end
end
