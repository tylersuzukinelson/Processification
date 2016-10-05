class EstimationTicketsController < ApplicationController
  before_action :ticket, only: [:show, :edit, :update]

  def create
    if estimation_session
      estimation_session.estimation_tickets.create(ticket_params)
      redirect_to es, notice: "Created ticket"
    else
      redirect_to estimation_sessions_path, alert: "Failed to create ticket"
    end
  end

  def show
  end

  private

  def ticket
    @ticket ||= estimation_session.estimation_tickets.find(params[:id])
  end

  def estimation_session
    @estimation_session ||= EstimationSession.where(id: session_ids).find(params[:estimation_session_id])
  end

  def ticket_params
    params.require(:estimation_ticket).permit(:ticket)
  end

  def session_ids
    @session_ids ||= EstimationParticipant.where(user_id: current_user.id).limit(10).pluck(:estimation_session_id)
  end
end
