class UsersController < ApplicationController

  def index
    if session[:current_user_id]
      @users = User.last(100)
      @user = User.find(session[:current_user_id])
    else
      redirect_to login_path
    end
  end

  def new 
    @user = User.new
  end

  def create
    # create the new user

    # long form
    # @user = User.new(
    #   first_name: params[:user][:first_name],
    #   last_name: params[:user][:last_name],
    #   email: params[:user][:email],
    #   password: params[:user][:password]
    # )

    # short form
    @user = User.create(params.require(:user).permit(:email, :password, :first_name, :last_name))

    # save the new user
    @user.save

    # log them in 
    session[:current_user_id] = @user.id

    # redirect
    # redirect_to user_path(@user.id)
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params.require(:user).permit(:email, :first_name, :last_name))
    redirect_to user_path(@user.id)
  end  

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    # redirect
    redirect_to logout_path, method: :delete
    # redirect_to users_path
  end
  
end
