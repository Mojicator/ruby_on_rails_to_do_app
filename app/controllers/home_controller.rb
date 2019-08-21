class HomeController < ApplicationController
  def index
    redirect_to users_index_path if current_user
  end
end
