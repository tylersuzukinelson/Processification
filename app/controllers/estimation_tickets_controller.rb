class EstimationTicketsController < ApplicationController
  def create
    if es = scope.find(params[:id])
      es.estimation_tickets.create(ticket_params)
      redirect_to es, notice: "Created ticket"
    else
      redirect_to estimation_sessions_path, alert: "Failed to create ticket"
    end
  end

  private

  def ticket_params
    params.require(:estimation_ticket).permit(:ticket)
  end

  def session_ids
    EstimationParticipant.where(user_id: current_user.id).limit(10).pluck(:estimation_session_id)
  end

  def scope
    EstimationSession.where(id: session_ids)
  end
end
