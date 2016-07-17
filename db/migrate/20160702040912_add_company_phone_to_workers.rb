class AddCompanyPhoneToWorkers < ActiveRecord::Migration
  def up
    add_column :users, :company_phone, :string, default:  ""
  end

  def down
    remove_column :users, :company_phone
  end
end
