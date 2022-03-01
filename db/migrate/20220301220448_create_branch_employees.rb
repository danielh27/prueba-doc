class CreateBranchEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :branch_employees do |t|
      t.string :name
      t.string :rfc
      t.string :role
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
