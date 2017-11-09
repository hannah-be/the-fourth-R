class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :sender, { foreign_key: { to_table: :users }}
      t.references :recipient, { foreign_key: { to_table: :users }}
      t.references :repair, foreign_key: true

      t.timestamps
    end
  end
end
