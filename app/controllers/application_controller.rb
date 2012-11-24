# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :get_current_user
  
  def get_current_user
    @current_user = session[:user]
  end
  
  def require_login
    if not @current_user
      flash[:notice] = "Please login to access this page"
      redirect_to "/access/login"
    end
  end
  
  def require_admin
    if not (@current_user && @current_user.admin)
      flash[:notice] = "You don't have privileges to access this page"
      redirect_to "/access/login"
    end
  end
end
