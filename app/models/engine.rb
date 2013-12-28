class Engine < ActiveRecord::Base
  attr_accessible :fuel_id, :power_rating, :model
  belongs_to :fuel
  has_many :vehicle
end
