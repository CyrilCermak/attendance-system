class AddPositionsToDepartment < ActiveRecord::Migration
  def up
    add_reference :departments, :positions, index: true, foreign_key: true
  end

  def down
    remove_reference :departments, :positions, index: true, foreign_key: true
  end
end
