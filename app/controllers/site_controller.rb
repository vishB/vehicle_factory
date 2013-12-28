class SiteController < ApplicationController
  def index
  	User.one_admin # First registered user should be admin

  	# Check if user has logged in.
  	redirect_to new_user_session_path unless user_signed_in?
  end
end
