class RemovePositionsIdFromDepartment < ActiveRecord::Migration
  def up
    remove_reference :departments, :positions
  end
end
