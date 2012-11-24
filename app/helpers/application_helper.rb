# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def logged_message
    if @current_user
      return "Logged in as #{@current_user.username}"
    else
      return "Not logged in"
    end
  end
end
