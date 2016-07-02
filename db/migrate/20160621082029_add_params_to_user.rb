class AddParamsToUser < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mac, :string
    add_column :users, :ip, :string
    add_column :users, :state, :boolean
    add_column :users, :host_name, :string
    add_reference :users, :position, add_foreign_key: true, index: true
    add_reference :users, :time_tables, add_index:true ,add_foreign_key: true
  end

  def down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :mac
    remove_column :users, :ip
    remove_column :users, :state
    remove_column :users, :host_name
    remove_reference :users, :position
    remove_reference :users, :time_tables
  end
end
