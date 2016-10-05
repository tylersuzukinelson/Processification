class CreateRetroItems < ActiveRecord::Migration
  def change
    create_table :retro_items do |t|
      t.references :user
      t.references :retro_session
      t.text :body
      t.integer :category

      t.timestamps null: false
    end
    add_index :retro_items, :user_id
    add_index :retro_items, :retro_session_id
  end
end
