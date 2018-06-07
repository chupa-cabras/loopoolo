class UserCompetencyLevel < ApplicationRecord
  belongs_to :user
  belongs_to :competency
  belongs_to :level

  validates :user, presence: true
  validates :competency, presence: true
  validates :level, presence: true
end
