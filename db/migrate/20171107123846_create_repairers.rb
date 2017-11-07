class CreateRepairers < ActiveRecord::Migration[5.1]
  def change
    create_table :repairers do |t|
      t.references :user, foreign_key: true
      t.string :business_name
      t.references :address, foreign_key: true
      t.string :category
      t.text :description
      t.boolean :will_travel
      t.text :photo_data

      t.timestamps
    end
    add_index :repairers, :business_name, unique: true
    add_index :repairers, :category
  end
end
