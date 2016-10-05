class CreateEstimationTickets < ActiveRecord::Migration
  def change
    create_table :estimation_tickets do |t|
      t.references :estimation_session, index: true
      t.string :ticket

      t.timestamps null: false
    end
    add_foreign_key :estimation_tickets, :estimation_sessions
  end
end
