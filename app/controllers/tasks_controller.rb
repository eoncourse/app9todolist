class TasksController < ApplicationController
  before_filter :require_login
  
  def index
    @tasks = Task.find_all_by_user_id(@current_user.id)
  end

  def create
    @task = Task.create(:name => params[:name])
    @task.user = @current_user
    @task.save   
    redirect_to :action => 'index'
  end
  
  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :action => 'index'
  end
end
