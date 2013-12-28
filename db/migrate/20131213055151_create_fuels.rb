class CreateFuels < ActiveRecord::Migration
  def change
    create_table :fuels do |t|
      t.string :fuel_type
      t.integer :engine_id

      t.timestamps
    end
  end
end
