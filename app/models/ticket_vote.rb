class TicketVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :estimation_ticket
  has_one :vote_note
end
