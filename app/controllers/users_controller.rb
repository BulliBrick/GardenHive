class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, except: [:show]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @user_roles = UserRole.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User created successfully.'
    else
      @user_roles = UserRole.all
      render :new
    end
  end

  def edit
    @user_roles = UserRole.all
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User updated successfully.'
    else
      @user_roles = UserRole.all
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User deleted successfully.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_role_id)
  end

  def authorize_admin
    # Implement admin authorization logic here
    # For example, using CanCanCan:
    # authorize! :manage, User
  end
end