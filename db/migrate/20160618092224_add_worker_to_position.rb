class AddWorkerToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :worker, :reference
  end
end
