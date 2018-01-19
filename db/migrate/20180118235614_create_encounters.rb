class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.datetime :date
      t.integer :status
      t.text :observations
      t.integer :target_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
