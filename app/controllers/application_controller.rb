class ApplicationController < ActionController::Base
  protect_from_forgery
  
  add_breadcrumb "Home", :root_path

  def get_list
    # Collecting Vehicle types
    vehicle_types = VehicleType.all                            
    @vehicle_types = vehicle_types.collect { |x| x.kind }  

    # Collecting Engine Information
    engines = Engine.all
    @engines = engines.collect { |x| x.model }

    # Collecting Vehicle Information
    vehicles = Vehicle.all
    @vehicles = vehicles.collect { |x| x.v_identifier}
  end  
end
