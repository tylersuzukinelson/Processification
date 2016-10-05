class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :estimation_participants
  has_many :retro_items
  has_many :retro_participants
  has_many :team_memberships
  has_many :ticket_votes
  has_many :estimation_sessions, through: :estimation_participants
  has_many :retro_sessions, through: :retro_participants
  has_many :teams, through: :team_memberships

  before_create :temp_set_name

  def observer?(estimation_session)
    estimation_participants.find_by(estimation_session: estimation_session).try(:observer) == true
  end

  private

  def temp_set_name
    self.name = email.split("@").first.split(".").try(:map, &:capitalize).try(:join, " ")
  end
end
