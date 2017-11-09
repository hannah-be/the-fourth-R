class AddUserIdToRepairs < ActiveRecord::Migration[5.1]
  def change
    add_reference :repairs, :user, foreign_key: true
  end
end
