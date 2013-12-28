class AddModelToEngine < ActiveRecord::Migration
  def change
    add_column :engines, :model, :string
  end
end
