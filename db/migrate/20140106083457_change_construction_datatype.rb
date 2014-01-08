class ChangeConstructionDatatype < ActiveRecord::Migration
  def up
    change_table :constructions do |t|
      t.change :start_date, :date 
      t.change :delivery_date, :date 
    end
  end

  def down
  end
end
