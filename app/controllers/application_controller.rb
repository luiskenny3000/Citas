class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :get_type

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

  def get_type
    @type = session[:user_type]
  end

end
