class Competencies < ActiveRecord::Migration[5.0]
  def change
    create_table :competencies do |t|
      t.string     :name
      t.string     :description
      t.references :competency_type, foreign_key: true

      t.timestamps
    end
  end
end
