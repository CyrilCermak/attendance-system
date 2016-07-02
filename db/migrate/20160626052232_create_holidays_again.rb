class CreateHolidaysAgain < ActiveRecord::Migration
  def up
    create_table :holidays do |t|
      t.datetime :start
      t.datetime :end
      t.string :name
      t.boolean :reviewed, default: false
      t.references :worker

      t.timestamps null: false
    end
  end

  def down
    drop_table :holidays
  end

end
