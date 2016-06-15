class UsersController < ApplicationController
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
      flash[:success] = "Welcome to Business Referral Alliance!"
      redirect_to @user
    else
      render "new"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :address, :zip_code, :city, :state, :career, :experience, :years_at_job, :bio)
  end
  
end
