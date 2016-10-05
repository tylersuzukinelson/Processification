class RetroItem < ActiveRecord::Base
  belongs_to :retro_session
  belongs_to :user
end
