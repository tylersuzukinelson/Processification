class VoteNote < ActiveRecord::Base
  belongs_to :ticket_vote
end
