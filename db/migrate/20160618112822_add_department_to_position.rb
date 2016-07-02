class AddDepartmentToPosition < ActiveRecord::Migration
  def up
    add_reference :positions, :department, index: true, foreign_key: true
  end

  def down
    remove_reference :positions, :department, index: true, foreign_key: true
  end

end
