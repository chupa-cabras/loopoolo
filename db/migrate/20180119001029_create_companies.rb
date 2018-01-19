class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :logo
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
