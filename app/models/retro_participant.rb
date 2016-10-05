class RetroParticipant < ActiveRecord::Base
  belongs_to :user
  belongs_to :retro_session
end
