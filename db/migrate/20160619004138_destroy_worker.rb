class DestroyWorker < ActiveRecord::Migration
  def change
    drop_table :workers
  end
end
