class CompetenciesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :competencies_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :competency, index: true
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
