class User < ActiveRecord::Base
  attr_accessible :username,  :first_name, :last_name, :password, :password_confirmation,
                  :date_of_birth, :security_question, :security_answer, :active, :admin

  has_many :tasks
  validates_presence_of :username
  validates_presence_of :password
  validates_confirmation_of :password
  
  QUESTIONS = [
    "What is your mother's maiden name?",
    "What is your first telephone number?",
    "What is your first teacher's name?"        
  ]
end
