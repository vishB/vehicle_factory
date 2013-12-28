class VehiclesController < ApplicationController
  before_filter :authenticate_user!
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
    add_breadcrumb "#{@vehicle.vehicle_type}-#{@vehicle.v_identifier}", :vehicles_path
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.json
  def new
    add_breadcrumb "Vehicles", :new_vehicle_path
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
    add_breadcrumb "Vehicles", :edit_vehicle_path
    @vehicle = Vehicle.find(params[:id])
    get_list
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    #get_list
    engine = Engine.where(:model => params[:vehicle][:engine_id] )
    params[:vehicle][:engine_id] = engine.first.id
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
    if @vehicle.construction.delivery_date < Time.now
      respond_to do |format|
        if @vehicle.destroy
          flash[:notice] = " Vehicle deleted successfully."
          format.html { redirect_to vehicles_url }
          format.js { render :json => {:vehicle => "#{vehicle}"}}
          #format.json { head :no_content }
          #format.js   { render :layout => false }
        else
          flash[:error] = "Sorry! Vehicle delivery date has not passed yet."
          format.html { render action: "index" }
          #format.js   { render :layout => false }
        end
      end 
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
    # Second information url shows identifier,engine information and vehicle delivery date
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
      @power = Engine.where(:model => params[:engine_model]).first.power_rating
      respond_to do |format|
        #format.json { render :json => @power.to_json}
        format.js { render :layout => false, :locals => {:power => @power} } 
      end
    end
  end  
end