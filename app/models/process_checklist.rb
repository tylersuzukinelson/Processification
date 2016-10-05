class ProcessChecklist < ActiveRecord::Base
  belongs_to :team_process
  has_many :checklist_items
end
