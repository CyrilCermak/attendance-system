class AddPositionsToDepartment2 < ActiveRecord::Migration
  def up
    add_reference :departments, :positions, add_foreign_key: true, add_index: true
  end

  def down
    remove_reference :departments, :positions, foreign_key: true
  end
end
