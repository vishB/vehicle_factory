class FuelsController < ApplicationController
  before_filter :authenticate_user!
  # GET /fuels
  # GET /fuels.json
  def index
    @fuels = Fuel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fuels }
    end
  end

  # GET /fuels/1
  # GET /fuels/1.json
  def show
    @fuel = Fuel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fuel }
    end
  end

  # GET /fuels/new
  # GET /fuels/new.json
  def new
    @fuel = Fuel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fuel }
    end
  end

  # GET /fuels/1/edit
  def edit
    @fuel = Fuel.find(params[:id])
  end

  # POST /fuels
  # POST /fuels.json
  def create
    @fuel = Fuel.new(params[:fuel])

    respond_to do |format|
      if @fuel.save
        format.html { redirect_to @fuel, notice: 'Fuel was successfully created.' }
        format.json { render json: @fuel, status: :created, location: @fuel }
      else
        format.html { render action: "new" }
        format.json { render json: @fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fuels/1
  # PUT /fuels/1.json
  def update
    @fuel = Fuel.find(params[:id])

    respond_to do |format|
      if @fuel.update_attributes(params[:fuel])
        format.html { redirect_to @fuel, notice: 'Fuel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuels/1
  # DELETE /fuels/1.json
  def destroy
    @fuel = Fuel.find(params[:id])
    @fuel.destroy

    respond_to do |format|
      format.html { redirect_to fuels_url }
      format.json { head :no_content }
    end
  end
end
