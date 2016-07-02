class AddReviewedToHolidays < ActiveRecord::Migration
  def up
    add_column :holidays, :reviewed, :boolean ,default: false
  end

  def down
    remove_column :holidays, :reviewed
  end
end
