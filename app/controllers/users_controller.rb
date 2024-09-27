class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show, :new, :create]
  before_action :authorize_user, only: [:show ]

  def index
    @users = User.all 
    @users = @users
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User updated successfully.'
    else
      render :edit, notice: 'There was an error updating the user.'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User deleted successfully.'
  end

  private

  def set_user
    @user = User.find(params[:id])
    unless @user
      redirect_to users_path, alert: 'User not found.'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_role)
  end  



  def authorize_user
    unless current_user.admin? || current_user == @user
      flash[:alert] = "You are not authorized to view this profile."
      redirect_to root_path
    end
  end

  def admin?
    current_user.user_role == "admin"
  end
  def moderator?
    current_user.user_role == "moderator"
  end

end