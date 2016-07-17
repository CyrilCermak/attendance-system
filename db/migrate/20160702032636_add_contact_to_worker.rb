class AddContactToWorker < ActiveRecord::Migration
  def up
    add_column :workers, :phone, :string
  end

  def down
    remove_column :workers, :phone
  end
end
