class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.integer :power_rating
      t.integer :fuel_id

      t.timestamps
    end
  end
end
