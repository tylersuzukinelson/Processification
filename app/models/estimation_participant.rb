class EstimationParticipant < ActiveRecord::Base
  belongs_to :user
  belongs_to :estimation_session
end
