class EstimationTicket < ActiveRecord::Base
  belongs_to :estimation_session
  has_many :ticket_votes

  def pending_votes
    estimation_session.user_ids - ticket_votes.pluck(:user_id)
  end

  def pending_votes?
    !pending_votes.empty?
  end
end
