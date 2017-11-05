class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :category
      t.text :description
      t.text :problem
      t.text :photo_data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
