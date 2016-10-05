class EstimationSessionsController < ApplicationController
  def index
    session_ids = EstimationParticipant.where(user_id: current_user.id).order(id: :desc).limit(10).pluck(:estimation_session_id)
    @sessions = EstimationSession.where(id: session_ids).preload(:estimation_tickets)
  end
end
