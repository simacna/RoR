module SessionsHelper

  #Logs in the given user
  def log_in(user)
    #below creates a temporary cookie - encrypted version of user's id
    #allows us to retrieve id in subsequent pages and expires immediately when browser closed
    session[:user_id] = user.id
  end

  #Logs out the current user
  def log_out #we'll add the method to the sessions helper module
    session.delete(:user_id)
    @current_user = nil
  end

  #Returns the current logged-in user (if any)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #Returns true if current_user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end
end
