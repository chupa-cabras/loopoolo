class CreateQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :quests do |t|
      t.string :description
      t.integer :requestor_id, index: true, foreign_key: true
      t.integer :executor_id, index: true, foreign_key: true
      t.integer :status
      t.timestamps
    end
  end
end
