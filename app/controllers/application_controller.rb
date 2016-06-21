class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_background_url

  # Devise redirection URLs
  def after_sign_in_path_for(user)
    bookmarks_path
  end

  def after_sign_out_path_for(user)
    root_path
  end

  # Store previous page
  def store_location
    store_location_for :user, request.referer
  end

  def set_background_url
    if user_signed_in?
      @background_url = current_user.user_profile.background_image.url
    end
  end
end