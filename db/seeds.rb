# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create basic vehicle types.
vehicle_types = VehicleType.all
fuel_types = Fuel.all

if vehicle_types.blank?
	vehicle_types = ["Satellite", "Shuttle"]
	vehicle_types.each do |kind|
  	VehicleType.create( kind: kind )
  end  	
end	

if fuel_types.blank?
	fuel_types = ["Chemical”, “Antimatter”, “Gasoline"]
	fuel_types.each do |fuel|
		Fuel.create( fuel_type: fuel )
	end
end	
