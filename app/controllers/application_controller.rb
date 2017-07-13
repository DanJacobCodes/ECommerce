class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index]
  helper_method :current_order
  helper_method :current_user
  before_action :only => [:rails_admin] do
  redirect_to new_user_session_path unless current_user && current_user.admin
  end


  def index

  end





  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :admin])
  end

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end


end
