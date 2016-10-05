class CreateVoteNotes < ActiveRecord::Migration
  def change
    create_table :vote_notes do |t|
      t.references :ticket_vote, index: true
      t.text :note

      t.timestamps null: false
    end
    add_foreign_key :vote_notes, :ticket_votes
  end
end
