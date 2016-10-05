class EstimationSessionsController < ApplicationController
  def index
    session_ids = EstimationParticipant.where(user_id: current_user.id).limit(10).pluck(:estimation_session_id)
    @sessions = EstimationSession.where(id: session_ids).order(id: :desc).preload(:estimation_tickets)
  end

  def create
    es = EstimationSession.create
    es.estimation_participants.create(user: current_user, observer: false)
    redirect_to estimation_sessions_path, notice: "Created estimation session"
  end
end
