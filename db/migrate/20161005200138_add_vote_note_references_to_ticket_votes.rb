class AddVoteNoteReferencesToTicketVotes < ActiveRecord::Migration
  def change
    add_column :ticket_votes, :vote_note_id, :integer
    add_foreign_key :ticket_votes, :vote_notes
    add_index :ticket_votes, :vote_note_id
  end
end
