class RenameColumns < ActiveRecord::Migration
  def up
    rename_column :time_tables, :arrival, :start
    rename_column :time_tables, :departure, :end
  end

  def down
    rename_column :time_tables, :start, :arrival
    rename_column :time_tables, :end, :departure
  end
end
