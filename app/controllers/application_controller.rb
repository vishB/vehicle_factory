class ApplicationController < ActionController::Base
  protect_from_forgery
  
  add_breadcrumb "Home", :root_path

  def back
    session[:url] = request.original_url
    session[:last_url] = request.referrer
  end

  def get_list
    # Collecting Vehicle types
    vehicle_types = VehicleType.all                            
    @vehicle_types = vehicle_types.collect { |x| x.kind }  

    # Collecting Engine Information
    @engines = Engine.all

    # Collecting Vehicle Information
    vehicles = Vehicle.all
    @vehicles = vehicles.collect { |x| x.v_identifier}
  end

  # find available vehicles for selected vehicle
  def get_available_users(vehicle)
    vehicle_users = vehicle.first.users
    all_users = User.all
    @available_users = all_users - vehicle_users
  end
  
  # Check if logged in user is admin
  def check_admin
    unless current_user.admin?
      redirect_to root_path
    end  
  end
end
