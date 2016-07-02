class RemovePositionFromWorker < ActiveRecord::Migration
  def change
    remove_column :workers, :position, :reference
  end
end
