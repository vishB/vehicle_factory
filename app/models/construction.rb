class Construction < ActiveRecord::Base
  attr_accessible :delivery_date, :start_date, :user_id, :vehicle_id,:engine_id,:v_identifier
  belongs_to :vehicles
  validate :delivery_date, :start_date, :presence_of => true, :if => vehicle.construction.present?
end
