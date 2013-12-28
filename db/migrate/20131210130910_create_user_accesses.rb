class CreateUserAccesses < ActiveRecord::Migration
  def change
    create_table :user_accesses do |t|
      t.integer :user_id
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
