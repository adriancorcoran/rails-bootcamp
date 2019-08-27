class DashboardsController < ApplicationController
  def hello
  end

  def hi
  end

  def personalized
      @name = params[:name]
  end
  
  def reversed
      @name = params[:name].reverse
      render :personalized
  end

end