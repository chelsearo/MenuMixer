module SessionsHelper

  
  def log_in(user)
    if session[:user_id] = user.id
      redirect_to recipe_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end