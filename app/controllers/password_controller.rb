class PasswordController < ApplicationController
  before_action :set_user
  
  def edit
  end

  def update
    if @user.authenticate(params[:user][:current_password])
      if @user.update(password_params)
        redirect_to @user, notice: 'Password updated successfully.'
      else
        render :edit, alert: 'There was an error updating the password.'
      end
    else
      flash.now[:alert] = 'Current password is incorrect.'
      render :edit
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end 

end
