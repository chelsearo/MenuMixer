class SessionsController < ApplicationController
    include SessionsHelper
    protect_from_forgery with: :exception

  
    def new
        @user = User.new
    end
    
  
    def create
        @user = User.new(user_params)
        if @user.save
          log_in @user
          flash[:success] = "Welcome to Menu Mixer!"
          redirect_to root_path
          
        else
            @error = @user.errors.full_messages
          render 'new'
          
        end
      end
  
    def destroy
        log_out
        redirect_to root_url
    end
  
 

  def google
      @user = User.find_or_create_by(username: auth["info"]["name"]) do |user| 
          user.password =  SecureRandom.hex(10)
      end 
      if @user && @user.id
          session[:user_id] = @user.id
          redirect_to recipes_path 
      else 
          redirect_to "/login"
      end 
  end 


  private 

  def auth
      request.env['omniauth.auth']
  end 

  def user_params
      params.require(:user).permit(:username, :email, :password)
  end 
end 