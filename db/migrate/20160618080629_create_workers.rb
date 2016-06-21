class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :host_name
      t.string :ip
      t.string :mac
      t.boolean :state

      t.timestamps null: false
    end
  end
end
