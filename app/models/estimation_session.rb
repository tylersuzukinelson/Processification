class EstimationSession < ActiveRecord::Base
  has_many :estimation_participants
  has_many :estimation_tickets
  has_many :users, through: :estimation_participants
end
