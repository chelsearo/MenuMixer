class UsersController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  def show
   if @user = User.find(params[:id])
    redirect_to home_path
   else 
    flash.now[:danger] = 'Invalid email/password combination'
   end 
  end 
    
  def new
    @user = User.new
  end
 
  def create
    
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to root_path
    else
      @error = 'Invalid email/password combination'
      render 'new'
    end
  end
  
 
  
  private

    def user_params
      params.require(:user).permit(:username, :password,:user_id, :name, :email
                                   )
    end
end
