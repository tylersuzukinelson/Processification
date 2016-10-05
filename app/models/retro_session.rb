class RetroSession < ActiveRecord::Base
  has_many :retro_items
  has_many :retro_participants
  has_many :users, through: :retro_participants
end
