class CreateEstimationParticipants < ActiveRecord::Migration
  def change
    create_table :estimation_participants do |t|
      t.references :user, index: true
      t.references :estimation_session, index: true
      t.boolean :observer

      t.timestamps null: false
    end
    add_foreign_key :estimation_participants, :users
    add_foreign_key :estimation_participants, :estimation_sessions
  end
end
