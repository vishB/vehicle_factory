class CreateConstructions < ActiveRecord::Migration
  def change
    create_table :constructions do |t|
      t.integer :vehicle_id
      t.datetime :start_date
      t.datetime :delivery_date
      t.integer :user_id

      t.timestamps
    end
  end
end
