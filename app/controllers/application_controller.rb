class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :is_admin?

  def routingError
    render :file => "#{Rails.root}/public/404.html", :status => 404
  end

  private
  
  def current_user
    @current_user ||= User.find(:first, :conditions => ['auth_token = ?', cookies[:auth_token]]) if cookies[:auth_token]
  end

  def require_login
    unless current_user
      redirect_to root_path, notice: 'You must be logged in to do that.'
    end
  end
  
  def require_admin
    unless is_admin?
      redirect_to root_path
    end
  end

  def is_admin?
    if current_user && (current_user.super_admin? || current_user.admin?)
      return true
    else
      return false
    end
  end
end
