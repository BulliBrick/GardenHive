class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  include Pundit::Authorization

  
  allow_browser versions: :modern
  helper_method :current_user, :logged_in?
  before_action :set_paper_trail_whodunnit


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to login_path, alert: 'You must be logged in to access this section.' unless current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:alert] = "You must be an admin to access this section"
      redirect_to root_path
    end
  end

  def require_mod
    unless logged_in? && current_user.moderator?
      flash[:alert] = "You must be an moderator to access this section"
      redirect_to root_path
    end
  end


  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def set_paper_trail_whodunnit
    PaperTrail.request.whodunnit = current_user&.id
  end


end


