class RemoveReviewedFromHolidays < ActiveRecord::Migration
  def up
    drop_table :holidays
  end

  def down
    create_table :holidays do |t|
      t.datetime :start
      t.datetime :end
      t.string :name
      t.references :worker

      t.timestamps null: false
    end
  end
end
