class AddWorkersToPosition < ActiveRecord::Migration
  def change
    add_column :position_id, :workers, :reference
  end
end
