class TeamProcess < ActiveRecord::Base
  belongs_to :team
  has_many :process_checklists
end
