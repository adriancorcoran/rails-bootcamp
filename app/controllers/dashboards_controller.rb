class DashboardsController < ApplicationController
  
  def index
    @rentals = Rental.last(100)
  end

  def personalized
      @name = params[:name]
  end
  
  def reversed
      @name = params[:name].reverse
      render :personalized
  end

end