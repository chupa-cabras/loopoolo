class Team < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :users, join_table: 'users_teams'
end
