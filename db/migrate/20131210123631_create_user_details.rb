class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :sex
      t.integer :phone

      t.timestamps
    end
  end
end
