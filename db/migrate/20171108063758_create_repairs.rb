class CreateRepairs < ActiveRecord::Migration[5.1]
  def change
    create_table :repairs do |t|
      t.references :item, foreign_key: true
      t.references :repairer, foreign_key: true
      t.string :charge_identifier

      t.timestamps
    end
  end
end
