class AddSharedColumnToUserAccess < ActiveRecord::Migration
  def change
    add_column :user_accesses, :shared, :boolean
  end
end
