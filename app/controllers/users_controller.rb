class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
 
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(user_params)    
    
    if @user.save
      
      #TRY 1
      # log_in @user
      # remember @user
      # flash[:success] = "Welcome to the Sample App!"
      # Handle a successful save.
      # redirect_to @user
      
      #TRY 2
      UserMailer.account_activation(@user).deliver_now
 
      #@user.send_activation_email  #SENDGRID
      
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
      
      
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  #Sample Route: /users/32/followers
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  #Sample Route: /users/32/following
  
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  

private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    #redirect_to(root_url) unless @user == current_user
    redirect_to(root_url) unless current_user?(@user)
  end
end
