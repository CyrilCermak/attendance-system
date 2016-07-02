class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :floor

      t.timestamps null: false
    end
  end
end
