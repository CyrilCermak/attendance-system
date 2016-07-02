class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :wage

      t.timestamps null: false
    end
  end
end
