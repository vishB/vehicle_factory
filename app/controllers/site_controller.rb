class SiteController < ApplicationController
  def index
  	# Check if user has logged in.
    if user_signed_in?
      redirect_to vehicles_path unless current_user.admin?
    else
      redirect_to new_user_session_path
    end  
  end
end
