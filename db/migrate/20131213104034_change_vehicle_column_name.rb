class ChangeVehicleColumnName < ActiveRecord::Migration
  def up
  	rename_column :vehicles, :type, :vehicle_type
  end

  def down
  end
end
