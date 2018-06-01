class CreateLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :levels do |t|
      t.string :name
      t.string :description, null: false
      t.integer :weight, default: 1

      t.timestamps
    end
  end
end
