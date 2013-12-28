class AddColumnsToUserAccess < ActiveRecord::Migration
  def change
    add_column :user_accesses, :appointment_date, :datetime
    add_column :user_accesses, :shared_by, :integer
  end
end
