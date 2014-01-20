class UserAccessController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin, :only => [:allocate_users]

  # Admin can allocate vehicles to users.
	def allocate_users
    @vehicle = Vehicle.where(:id => params[:id])
    @users = get_available_users @vehicle  #getting users who are not working on selected vehicle.
    get_list

    if params[:vehicle_id]  #Allocating vehicles to users.
      users = Array.new
      params.each do |key,value|
        users << value if key.starts_with?'check'
      end

      users.each do |user|
       UserAccess.create(:user_id => user,:vehicle_id => params[:vehicle_id], :shared_by => params[:shared_by], :appointment_date => Time.now)
       redirect_to vehicles_path       
       flash[:notice] = "Vehicle alotted successfully."
      end
    end
 	end# End of method allocate_users.

  
  # User can add more vehicles to work on.
	def add_more_vehicles
    add_breadcrumb "Vehicles", :vehicles_path
    add_breadcrumb "Add more vehicles", :root_path
    @vehicles = Vehicle.order(:vehicle_type)
    user_vehicles = User.find(params[:id]).vehicles
    @user_vehicles = []
    user_vehicles.each do |uv|
     @user_vehicles<<uv.id
    end

    if params[:user_id] 
      vehicles = Array.new
      params.each do |key,value|
        vehicles << value if key.starts_with?'check'
      end

      vehicles.each do |vehicle|
        UserAccess.create(:user_id => params[:id],:vehicle_id => vehicle, :shared_by => params[:id], :appointment_date => Time.now)
        flash[:notice] = "Vehicles added successfully."
      end
      redirect_to more_vehicles_path
    end
  end# End of method add_more_vehicles.

  def remove_vehicles
    if params[:user_id] 
      vehicles = Array.new
      params.each do |key,value|
        vehicles << value if key.starts_with?'check'
      end

      vehicles.each do |vehicle|
        vehicle = UserAccess.find_by_user_id(params[:id])
        vehicle.destroy
        flash[:notice] = "Vehicles deallocated successfully."
      end
      redirect_to more_vehicles_path
    end
  end  
  
  # Share vehicle with other users.
  def share_vehicles_with_users
    add_breadcrumb "Vehicles", :vehicles_path
    add_breadcrumb "share/unshare vehicles with users", :root_path
    @vehicle = Vehicle.where("id = ?", params[:id])
    @vehicle_users = @vehicle.first.users
    @users = User.all
    get_list
    
    if params[:vehicle_id]
      @vehicle = Vehicle.where("id = ?", params[:id])
      @users = User.all
      get_list

      #Allocating vehicles to users
      users = Array.new
      params.each do |key,value|
        users << value if key.starts_with?'check'
      end

      users.each do |user|
        UserAccess.create(:user_id => user,:vehicle_id => params[:vehicle_id], :shared_by => params[:shared_by], :appointment_date => Time.now)
        flash[:notice] = "Vehicle sharing successful."
      end
      redirect_to share_vehicles_with_users_path
    end # End of IF BLOCK.
  end # End of method share_vehicles_with_users.

  # Unshare shared vehicles
  def unshare_vehicles
    @vehicle = Vehicle.where("id = ?", params[:id])
    @vehicle_users = @vehicle.first.users
    @users = User.all
    get_list
    
    if params[:vehicle_id]
      @vehicle = Vehicle.where("id = ?", params[:id])
      @users = User.all
      get_list

      #Allocating vehicles to users
      users = Array.new
      params.each do |key,value|
        users << value if key.starts_with?'check'
      end

      users.each do |user|
        user = UserAccess.find_by_user_id(user)
        if user.destroy
          flash[:notice] = "Vehicle unsharing successful."
        end  
      end
      redirect_to share_vehicles_with_users_path
    end # End of 1st IF BLOCK.
  end # End of method share_vehicles_with_users.
end # End od Class.

