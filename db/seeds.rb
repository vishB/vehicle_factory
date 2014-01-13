# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create basic vehicle types.

	VehicleType.create( kind: 'Satellite' )
  VehicleType.create( kind: 'Shuttle' )

# Create basic fuel types.

	Fuel.create( fuel_type: 'chemical' )
  Fuel.create( fuel_type: 'Antimatter' )
  Fuel.create( fuel_type: 'Gasoline' )
