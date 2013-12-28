class RemoveColumns < ActiveRecord::Migration
  def up
  	remove_column :engines, :vehicle_id
  end

  def down
  end
end
