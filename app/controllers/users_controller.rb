class UsersController < ApplicationController
	#before_filter :authenticate_user!
  
  # GET /users
  # GET /users.json
  def index
    add_breadcrumb "Users", :users_path
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    add_breadcrumb "Profile", :users_path
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    add_breadcrumb "New user", :new_user_path
    @user = User.new
    @user.build_user_detail

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    add_breadcrumb "Edit user", :edit_user_path
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  # Admin settings
  def admin_settings
    add_breadcrumb "Admin settings", :admin_settings_users_path
    @users = User.all
  end
  
  # Transfer admin privileges to another user
  def change_admin
    if params[:old_admin] && params[:user_id]
      #create new admin
      new_admin = User.find(params[:user_id])
      new_admin.update_attributes(:admin => true) 

      #delete old admin
      old_admin = User.find(params[:old_admin])
      old_admin.update_attributes(:admin => false)
    end
    flash[:notice] = "Your admin priviliges has been changed. You can access your account as a normal user"
    #redirect_to root_path
  end
end
