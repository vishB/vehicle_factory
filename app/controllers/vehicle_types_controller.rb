class VehicleTypesController < ApplicationController
  before_filter :authenticate_user!
  # GET /vehicle_types
  # GET /vehicle_types.json
  def index
    @vehicle_types = VehicleType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicle_types }
    end
  end

  # GET /vehicle_types/1
  # GET /vehicle_types/1.json
  def show
    @vehicle_type = VehicleType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicle_type }
    end
  end

  # GET /vehicle_types/new
  # GET /vehicle_types/new.json
  def new
    @vehicle_type = VehicleType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle_type }
    end
  end

  # GET /vehicle_types/1/edit
  def edit
    @vehicle_type = VehicleType.find(params[:id])
  end

  # POST /vehicle_types
  # POST /vehicle_types.json
  def create
    @vehicle_type = VehicleType.new(params[:vehicle_type])

    respond_to do |format|
      if @vehicle_type.save
        format.html { redirect_to @vehicle_type, notice: 'Vehicle type was successfully created.' }
        format.json { render json: @vehicle_type, status: :created, location: @vehicle_type }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vehicle_types/1
  # PUT /vehicle_types/1.json
  def update
    @vehicle_type = VehicleType.find(params[:id])

    respond_to do |format|
      if @vehicle_type.update_attributes(params[:vehicle_type])
        format.html { redirect_to @vehicle_type, notice: 'Vehicle type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_types/1
  # DELETE /vehicle_types/1.json
  def destroy
    @vehicle_type = VehicleType.find(params[:id])
    @vehicle_type.destroy

    respond_to do |format|
      format.html { redirect_to vehicle_types_url }
      format.json { head :no_content }
    end
  end
end
