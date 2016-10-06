class TicketVotesController < ApplicationController
  def create
    @vote = ticket.ticket_votes.create(vote_params.merge(user: current_user))
    if @vote.save
      redirect_to [ticket.estimation_session, ticket], notice: "Thank you for voting!"
    else
      redirect_to root_path, alert: "Failed to vote"
    end
  end

  private

  def ticket
    @ticket ||= EstimationTicket.where(estimation_session_id: session_ids).find(params[:estimation_ticket_id])
  end

  def vote_params
    params.require(:ticket_vote).permit(:value)
  end

  def session_ids
    @session_ids ||= EstimationParticipant.where(user_id: current_user.id).pluck(:estimation_session_id)
  end
end
