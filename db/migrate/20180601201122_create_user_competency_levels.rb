class CreateUserCompetencyLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :user_competency_levels do |t|
      t.references :user, foreign_key: true
      t.references :competency, foreign_key: true
      t.references :level, foreign_key: true
      t.date :started_date

      t.timestamps
    end
  end
end
