class TicketVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :estimation_ticket
  has_one :vote_note

  VALUES = {
    0 => 1,
    1 => 2,
    2 => 3,
    3 => 5,
    4 => 8,
    5 => 13,
    6 => 21,
    7 => 34,
  }
end
