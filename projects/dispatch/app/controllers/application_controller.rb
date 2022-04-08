class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  include SessionsHelper

  protected 

  def authenticate
  	unless current_user
  		redirect_to root_url, alert: 'You need to sign in or sign up before continuing.'
  	end
  end

end
