class VehiclesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_dates, :only => [:create]

  # GET /vehicles
  # GET /vehicles.json
  def index
    add_breadcrumb "Vehicles", :vehicles_path
    if current_user.admin?
      @vehicles = Vehicle.order(:vehicle_type)
    else
      @vehicles = current_user.vehicles
    end   
       
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicles }
    end
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    @vehicle = Vehicle.find(params[:id])
    add_breadcrumb "Vehicles", :vehicles_path
    add_breadcrumb "#{@vehicle.vehicle_type}-#{@vehicle.v_identifier}", :vehicles_path
    back
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.json
  def new
    add_breadcrumb "Vehicles", :vehicles_path
    @vehicle = Vehicle.new
    @vehicle.build_construction
    get_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
    add_breadcrumb "Vehicles", :edit_vehicle_path
    add_breadcrumb "#{@vehicle.vehicle_type}-#{@vehicle.v_identifier}", :edit_vehicle_path
    get_list
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    get_list
    if params[:vehicle][:vehicle_type] == "Shuttle"
      params[:vehicle][:payload_weight] = nil
    end
    # engine = Engine.where(:id => params[:vehicle][:engine_id] )
    params[:vehicle][:v_identifier] = Vehicle.get_identifier
    @vehicle = Vehicle.new(params[:vehicle])

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to action: "index", notice: 'Vehicle was successfully created.' }
        format.json { render json: @vehicle, status: :created, location: @vehicle }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vehicles/1
  # PUT /vehicles/1.json
  def update
    get_list
    if params[:vehicle][:vehicle_type] == "Shuttle"
      params[:vehicle][:payload_weight] = nil
    end
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle = Vehicle.find(params[:id])
    vehicle = "#{@vehicle.vehicle_type}"+'-'+"#{@vehicle.v_identifier.to_s}"

    #Delete vehicle only if its delivery date has not passed yet
    respond_to do |format|
      #if @vehicle.construction.delivery_date < Time.now.to_date
        if @vehicle.destroy
          format.html { redirect_to vehicles_url }
          format.json { head :no_content }
          format.js { render :layout => false }
        end 
      #else
      #   flash[:error] = "Sorry! Vehicle cannot be deleted as delivery date has not passed yet."
      #   format.html { render action: "index" }  
      # end
    end  
  end
  
  # Vehicle information JSON response 
  def info
    # First information url shows identifier,engine information and list of users
    if params[:info] == "first_url"
      @vehicle = Vehicle.find(params[:id])
      @identifier = @vehicle.v_identifier
      @engine = @vehicle.engine
      @users = @vehicle.users
      render :json => {
        :identifier => @identifier,
        :engine => @engine,
        :users => @users
      }
      
    #Second information url shows identifier,engine information and vehicle delivery date
    elsif params[:info] == "second_url"
      @vehicle = Vehicle.find(params[:id])
      @identifier = @vehicle.v_identifier
      @engine = @vehicle.engine
      @delivery_date = @vehicle.construction.delivery_date.to_date
        render :json => {
          :identifier => @identifier,
          :engine => @engine,
          :delivery_date => @delivery_date
        }
    end
  end

  def engine_data 
    if params[:engine_model]
      @power = Engine.where(:id => params[:engine_model]).first.power_rating
      respond_to do |format|
        format.js { render :layout => false, :locals => {:power => @power} } 
      end
    end
  end

  def check_dates
    if params[:vehicle][:construction_attributes]
      start_date = params[:vehicle][:construction_attributes].values.first
      delivery_date = params[:vehicle][:construction_attributes].values.last
     
      if start_date.to_date > delivery_date.to_date
        respond_to do |format|
          flash[:error] = "Error! Delivery date less than start date."
          format.html { redirect_to new_vehicle_path }
          format.json { head :no_content }
        end
      end
    end
  end
end