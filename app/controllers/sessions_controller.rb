class SessionsController < ApplicationController
  def new
  end

  def create
    if user = Admin.find_by_email(params[:user_email]) and user.password == params[:password]
      session[:user_id] = user.id
      session[:user_type] = 'admin'
      redirect_to reservations_url
    else
      if user = Teacher.find_by_email(params[:user_email]) and user.password == params[:password]
        session[:user_id] = user.id
        session[:user_type] = 'teacher'
        redirect_to reservations_url
      else
        render 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_type] = nil
    redirect_to login_url
  end
end
