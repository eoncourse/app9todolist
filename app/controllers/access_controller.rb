class AccessController < ApplicationController
  def login
  end

  def authorize
    @user = User.find_by_username(params[:username])
    if @user && @user.active && @user.password == params[:password]
      session[:user] = @user
      redirect_to :controller => 'tasks'
    else
      session[:user] = nil
      flash[:notice] = "Wrong username and password combination"
      redirect_to :action => 'login'
    end
  end

  def logout
      session[:user] = nil
      flash[:notice] = "You have been logged out"
      redirect_to :action => 'login'    
  end
end
