class Team < ActiveRecord::Base
  has_many :team_memberships
  has_many :team_processes
  has_many :users, through: :team_memberships
end
