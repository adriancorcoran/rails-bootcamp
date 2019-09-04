class UsersController < ApplicationController

  def index
    if session[:current_user_id]
      @users = User.last(100)
      @user = User.find(session[:current_user_id])
      
      # generate shop url and add to session
      set_user_shop_url()

    else
      # add message
      flash[:title] = "Login"
      flash[:notice] = "Please login to view the current users."
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
    @user = User.create(params.require(:user).permit(:phone_number, :email, :password, :first_name, :last_name))

    # save the new user
    @user.save

    # log them in 
    session[:current_user_id] = @user.id

    # generate shop url and add to session
    set_user_shop_url()
    
    # add message
    flash[:title] = "User created!"
    flash[:success] = "Your new user account was created!"

    # redirect
    # redirect_to user_path(@user.id)
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])

    # generate shop url and add to session
    set_user_shop_url()

    # add message
    flash.now[:title] = "Edit user"
    flash.now[:notice] = "Below you may edit your profile"    
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params.require(:user).permit(:phone_number, :email, :first_name, :last_name))
    # add message
    flash[:title] = "User updated!"
    flash[:success] = "Your details were updated!"
    redirect_to user_path(@user.id)
  end  

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    # add message
    flash[:title] = "User deleted"
    flash[:notice] = "The user was deleted."

    # redirect
    redirect_to logout_path, method: :delete
    # redirect_to users_path
  end
  
  # set the unique url for the shop login link in the nav
  def set_user_shop_url()
    # add to session so it is easy to access
    session[:shop_url] = ShopifyMultipass.new(Rails.application.credentials.shop_multipass_secret).get_shop_login_url({
      email: @user.email,
      first_name: @user.first_name,
      last_name: @user.last_name,
      tag_string: "created by multipass"      
    })
  end
  
end

