class CreateRetroParticipants < ActiveRecord::Migration
  def change
    create_table :retro_participants do |t|
      t.references :user, index: true
      t.references :retro_session, index: true

      t.timestamps null: false
    end
    add_foreign_key :retro_participants, :users
    add_foreign_key :retro_participants, :retro_sessions
  end
end
