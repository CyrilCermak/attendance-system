class AddPositionToWorkers < ActiveRecord::Migration
  def up
    add_reference :workers, :position, add_foreign_key: true, index: true
  end
  def down
    remove_reference :workers, :position
  end
end
