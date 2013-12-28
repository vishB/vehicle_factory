class UserAccessController < ApplicationController
  before_filter :authenticate_user!
  # Unshare shared vehicle.
	def unshare_vehicle
    if params[:vehicle_id] && params[:shared_by] && params[:id]
      @vehicle = UserAccess.where(:user_id => params[:id],:vehicle_id => params[:vehicle_id], :shared_by => params[:shared_by]).first
      @vehicle.destroy
      flash[:notice] = "Vehicle unshared"
    end

    respond_to do |format|
      format.js   { render :layout => false }
    end  
  end  

  # Share vehicles with other users.
  def share_vehicle
    if params[:vehicle_id] && params[:shared_by] && params[:id]
      @vehicle = UserAccess.create(:user_id => params[:id],:vehicle_id => params[:vehicle_id], :shared_by => params[:shared_by])
      flash[:notice] = "Vehicle shared"
    end

    respond_to do |format|
      format.js   { render :layout => false }
    end  
  end# End of method share_vehicle.

  # Admin can allocate vehicles to users.
	def allocate_users
    @vehicle = Vehicle.where("id = ?", params[:id])
    @users = User.all
    get_list

    if params[:vehicle_id]  #Allocating vehicles to users.
      users = Array.new
      params.each do |key,value|
        users << value if key.starts_with?'check'
      end

      users.each do |user|
       UserAccess.create(:user_id => user,:vehicle_id => params[:vehicle_id], :shared_by => params[:shared_by], :appointment_date => Time.now)
       flash[:notice] = "Vehicles alotted to users successfully"
      end
    end
 	end# End of method allocate_users.
  
  # User can add more vehicles to work on.
	def add_more_vehicles
    add_breadcrumb "Vehicles", :vehicles_path
    add_breadcrumb "Add more vehicles", :root_path
    @vehicles = Vehicle.order(:vehicle_type)

    if params[:user_id] 
      vehicles = Array.new
      params.each do |key,value|
        vehicles << value if key.starts_with?'check'
      end

      vehicles.each do |vehicle|
        UserAccess.create(:user_id => params[:id],:vehicle_id => vehicle, :shared_by => params[:id], :appointment_date => Time.now)
        flash[:notice] = "Vehicles added successfully"
      end
      redirect_to :vehicles
    end
  end# End of method add_more_vehicles.

  def deallocate_user
    
  end
  
  # User can share vehicle with other users.
  def share_vehicles_with_users
    @vehicle = Vehicle.where("id = ?", params[:id])
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
        flash[:notice] = "Vehicles alotted to users successfully"
      end
    end # End of IF BLOCK.
  end # End of method share_vehicles_with_users.
end # End od Class.   