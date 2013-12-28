class RemoveColumnFromUserDetail < ActiveRecord::Migration
  def up
    remove_column :user_details, :email
  end

  def down
    add_column :user_details, :email, :string
  end
end
