class CreateQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :quests do |t|
      t.string :description
      t.integer :requestor
      t.integer :executor
      t.integer :status

      t.timestamps
    end
  end
end
