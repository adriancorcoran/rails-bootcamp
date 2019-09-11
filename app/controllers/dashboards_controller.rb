class DashboardsController < ApplicationController
  
  def index
    if session[:current_user_id]
      # get rentals
      @rentals = Rental.last(100)
    else
      # add message
      flash[:title] = "Login"
      flash[:notice] = "Please login to view rentals."
      redirect_to login_path
    end
  end

  def personalized
      @name = params[:name]
  end
  
  def reversed
      @name = params[:name].reverse
      render :personalized
  end

end