class CreateRetroItems < ActiveRecord::Migration
  def change
    create_table :retro_items do |t|
      t.references :user, index: true
      t.references :retro_session, index: true
      t.text :body
      t.integer :category

      t.timestamps null: false
    end
    add_foreign_key :retro_items, :users
    add_foreign_key :retro_items, :retro_sessions
  end
end
