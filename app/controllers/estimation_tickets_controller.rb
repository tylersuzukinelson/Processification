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

  def edit
  end

  def update
    if ticket.try(:update, ticket_params)
      redirect_to [ticket.estimation_session, ticket], notice: "Ticket updated"
    else
      flash[:alert] = "Failed to update ticket"
      render :edit
    end
  end

  def destroy
    es = ticket.try(:estimation_session)
    if ticket.try(:destroy)
      redirect_to es, notice: "Ticket deleted"
    else
      flash[:alert] = "Failed to delete ticket"
      redirect_to estimation_sessions_path
    end
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
