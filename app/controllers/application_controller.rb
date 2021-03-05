class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    
  
    
  
    def verified_user
      redirect_to '/signin' unless user_is_authenticated
    end
  
    def user_is_authenticated
      !!current_user
      flash[:danger] = 'You must be logged in to perform that action'
      redirect_to root_path
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
