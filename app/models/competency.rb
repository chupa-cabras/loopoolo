class Competency < ApplicationRecord
  has_many :competency_levels
  has_and_belongs_to_many :users, join_table: 'competencies_users'
  validates :name, presence: true
  validates :competency_type_id, presence: true

  def type_name
    CompetencyType.find(self.competency_type_id).try(:name) if self.competency_type_id.present?
  end
end
