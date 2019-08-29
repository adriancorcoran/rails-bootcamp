class UsersController < ApplicationController

  def index
    @users = User.last(10)
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

    # redirect
    redirect_to user_path(@user.id)
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
    redirect_to users_path
  end
  
end
