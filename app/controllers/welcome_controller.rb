class WelcomeController < ApplicationController
  layout 'layouts/landing'

  def index
    if user_signed_in?
      redirect_to bookmarks_path
    end
  end
end
