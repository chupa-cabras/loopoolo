class CompetencyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :competency_types do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :weight, default: 1

      t.timestamps
    end
  end
end
