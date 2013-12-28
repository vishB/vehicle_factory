class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :type
      t.integer :occupants
      t.float :payload_weight
      t.integer :v_identifier

      t.timestamps
    end
  end
end
