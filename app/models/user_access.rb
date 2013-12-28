class UserAccess < ActiveRecord::Base
  attr_accessible :user_id,:vehicle_id,:appointment_date,:shared_by
  belongs_to :user
  belongs_to :vehicle
end
