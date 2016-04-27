module SessionsHelper

  #Logs in the given user
  def log_in(user)
    #below creates a temporary cookie - encrypted version of user's id
    #allows us to retrieve id in subsequent pages and expires immediately when browser closed
    session[:user_id] = user.id
  end

  #Remembers a user in a persistent session
  def remember(user)
    user.remember #why is
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #Returns the user corresponding to the remember token cookie

  #Forget a persistent session

  def forget(user)
    user.forget #user class, forget method
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #Logs out the current user
  def log_out #we'll add the method to the sessions helper module
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  #Returns the current logged-in user (if any)
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      #raise #tests still pass, so this branch is currently untested
      user = User.find_by(id: user_id)
      #below authenticated method is used from user.rb model
      #what are the rules for passing methods from different
      #directories around?
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end 

  #Returns true if current_user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end
end
