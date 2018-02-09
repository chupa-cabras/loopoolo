class Competency < ApplicationRecord
  has_many :competency_levels
  has_and_belongs_to_many :users, join_table: 'competencies_users'
end
