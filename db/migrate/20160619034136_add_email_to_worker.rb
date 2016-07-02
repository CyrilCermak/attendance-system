class AddEmailToWorker < ActiveRecord::Migration
  def up
    add_column :workers, :email, :string
  end
  def down
    remove_column :workers, :email
  end
end
