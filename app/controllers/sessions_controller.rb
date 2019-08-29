class SessionsController < ApplicationController

  def new 
  end

  def create
    # information is in params[:email] and params [:password]
    
    # find a user with the same email address and password
    @user = User.where({email: params[:email], password: params[:password]}).first
    # if one exists, add their id to the session - redirect to the user's profile
    if @user
      session[:current_user_id] = @user.id
      # redirect_to user_path(@user.id)
      redirect_to users_path
    else
      redirect_to login_path
    end
  end
  
  def destroy
    session.delete(:current_user_id)
    redirect_to login_path
  end
  
end
