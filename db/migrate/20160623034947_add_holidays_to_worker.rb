class AddHolidaysToWorker < ActiveRecord::Migration
  def up
    add_reference :workers, :holidays, foreign_key: true, index: true
  end

  def down
    remove_reference :workers, :holidays
  end
end
