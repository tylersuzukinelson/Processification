class EstimationTicket < ActiveRecord::Base
  belongs_to :estimation_session
  has_many :ticket_votes
end
