class CreateUsersTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :users_teams do |t|
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true
    end
  end
end
