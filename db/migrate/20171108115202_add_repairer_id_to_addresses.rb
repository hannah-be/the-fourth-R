class AddRepairerIdToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :repairer, foreign_key: true
  end
end
