class AddPositionToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :position, :reference
  end
end
