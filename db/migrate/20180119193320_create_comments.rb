class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :encounter, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :visible
      t.text :content

      t.timestamps
    end
  end
end
