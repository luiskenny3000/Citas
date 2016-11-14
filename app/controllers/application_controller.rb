class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def autorize_admin
    unless session[:user_id] and session[:user_type] == 'admin'
      redirect_to login_url
    end
  end
  def autorize_teacher
    unless session[:user_id] and session[:user_type] == 'teacher'
      redirect_to login_url
    end
  end
  def autorize
    unless session[:user_id]
      redirect_to login_url
    end
  end
end
