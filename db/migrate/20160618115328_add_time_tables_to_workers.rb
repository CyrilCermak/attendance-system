class AddTimeTablesToWorkers < ActiveRecord::Migration
  def up
    add_reference :workers, :time_tables, add_index:true ,add_foreign_key: true
  end

end
