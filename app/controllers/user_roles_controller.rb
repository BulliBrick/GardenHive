class UserRolesController < ApplicationController
  before_action :set_user_role, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin

  def index
    @user_roles = UserRole.all
  end

  def show
  end

  def new
    @user_role = UserRole.new
  end

  def create
    @user_role = UserRole.new(user_role_params)
    if @user_role.save
      redirect_to @user_role, notice: 'User role created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user_role.update(user_role_params)
      redirect_to @user_role, notice: 'User role updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @user_role.destroy
    redirect_to user_roles_url, notice: 'User role deleted successfully.'
  end

  private

  def set_user_role
    @user_role = UserRole.find(params[:id])
  end

  def user_role_params
    params.require(:user_role).permit(:role)
  end

  def authorize_admin
    # Implement admin authorization logic here
    # For example, using CanCanCan:
    # authorize! :manage, UserRole
  end
end