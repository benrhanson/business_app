class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]  
  before_action :correct_user,   only: [:edit, :update]  
  
  # displays the signed in user
  def show
    @user = User.find(params[:id])
  end
  
  # displays form for signing up a user
  def new
    @user = User.new
  end
  # shows user profile
  def show
    @user = User.find(params[:id])
  end
  # creates user
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Business Referral Alliance!"
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end  
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :address, :zip_code, :city, :state, :career, :experience, :years_at_job, :bio)
  end
  
  # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end  
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end  
  
end
