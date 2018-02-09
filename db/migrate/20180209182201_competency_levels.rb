class CompetencyLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :competency_levels do |t|
      t.references :competency, foreign_key: true
      t.references :level, foreign_key: true
      t.integer    :weight

      t.timestamps
    end
  end
end
