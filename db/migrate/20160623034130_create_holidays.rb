class CreateHolidays < ActiveRecord::Migration
  def up
    create_table :holidays do |t|
      t.datetime :start
      t.datetime :end
      t.string :name
      t.references :worker

      t.timestamps null: false
    end
  end

  def down
  drop_table :holidays
  end
end
