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
      flash[:title] = "Logged in"
      flash[:success] = "You successfully logged in!"
      # redirect_to user_path(@user.id)
      redirect_to root_url
    else
      flash[:title] = "Could not log in"
      flash[:error] = "We could not log you in, please try again!!"
      redirect_to login_path
    end
  end
  
  def destroy
    # remove tehe user id from the session
    session.delete(:current_user_id)
    # remove tehe user shop url from the session
    session.delete(:shop_url)
    # add notices
    flash[:title] = "Logged out"
    flash[:notice] = "You are now logged out!"
  redirect_to login_path
  end
  
end