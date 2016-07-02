class Positions < ActiveRecord::Migration
  def up
    create_table :positions do |t|
      t.string :name
      t.integer :wage
      t.references :workers, add_foreign_key: true
      t.timestamps null: false
    end
  end

  def down
    drop_table :positions
  end

end
