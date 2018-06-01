class UserCompetencyLevel < ApplicationRecord
  belongs_to :user
  belongs_to :competency
  belongs_to :level
end
