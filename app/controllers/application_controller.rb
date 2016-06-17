class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
end