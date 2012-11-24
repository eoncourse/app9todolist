class SignupController < ApplicationController
  def step1
    @user = User.new
  end

  def step2
    @user = User.new(params[:user])
    if not @user.save
      render :action => 'step1'
    end    
  end

  def step3
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])    
  end

  def create
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    
    if @user.security_answer.blank?
      @user.errors.add(:security_answer, "must be filled")
      render :action => "step3"
      return
    end 
    @user.active = true
    @user.save
    flash[:notice] = "Congratulations, your account has been created"
    redirect_to :controller => 'tasks'
  end
end
