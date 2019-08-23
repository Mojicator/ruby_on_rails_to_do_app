class HomeController < ApplicationController
  def index
    @user = current_user
    @list = List.new
  end
end
