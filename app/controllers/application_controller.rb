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

  def get_shopping_cart
    session[:shopping_cart] ||= []
  end

  def add_to_shopping_cart(model_id, model_name)
    sc = get_shopping_cart
    index = sc.index([model_id, model_name])
    if !index
      sc << [model_id, model_name]
    end
  end

  def delete_one_item_from_shopping_cart(model_id, model_name)
    index = session[:shopping_cart].index([model_id, model_name])
    if !index.nil?
      session[:shopping_cart].delete_at(index)
    end
  end

  def delete_all_from_shopping_cart
    session[:shopping_cart] = nil
  end

  def require_login
    puts "

    ****************** require_login"
    unless current_user
      puts "****************** current_user"
      redirect_to membership_path, notice: 'You must be logged in to do that.'
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
