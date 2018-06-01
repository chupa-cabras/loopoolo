class CompetencyType < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :weight, presence: true
end
