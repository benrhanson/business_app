class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]  
  before_action :correct_user,   only: [:edit, :update] 
  before_action :admin_user,     only: :destroy
  
  # index page
  def index
    # if user is an admin, show all members from all teams. If user is not an admin, they only get to see their own team.
    if @current_user.admin == true
      @users = User.paginate(page: params[:page])
    else
      @filter = User.where(team_id: current_user.team_id).all
      @users = @filter.paginate(page: params[:page])
    end
  end
  
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
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
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
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # Confirms an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end
