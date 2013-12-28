class Fuel < ActiveRecord::Base
  attr_accessible :engine_id, :fuel_type
  has_many :engines
end
