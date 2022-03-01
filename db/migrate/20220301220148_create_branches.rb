class CreateBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :street_name
      t.string :neighborhood_name
      t.integer :outdoor_number
      t.integer :indoor_number
      t.integer :postal_code
      t.string :country
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
