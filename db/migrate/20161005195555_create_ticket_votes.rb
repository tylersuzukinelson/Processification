class CreateTicketVotes < ActiveRecord::Migration
  def change
    create_table :ticket_votes do |t|
      t.references :user, index: true
      t.references :estimation_ticket, index: true
      t.integer :value

      t.timestamps null: false
    end
    add_foreign_key :ticket_votes, :users
    add_foreign_key :ticket_votes, :estimation_tickets
  end
end
