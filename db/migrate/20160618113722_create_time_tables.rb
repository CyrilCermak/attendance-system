class CreateTimeTables < ActiveRecord::Migration
  def up
    create_table :time_tables do |t|
      t.datetime :arrival
      t.datetime :departure
      t.references :worker, add_foreign_key: true, add_index: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :time_tables
  end
end
