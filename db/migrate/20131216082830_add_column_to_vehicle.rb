class AddColumnToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :engine_id, :integer
  end
end
