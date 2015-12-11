module SessionsHelper

  #Logs in the given user
  def log_in(user)
    #below creates a temporary cookie - encrypted version of user's id
    #allows us to retrieve id in subsequent pages and expires immediately when browser closed
    session[:user_id] = user.id
  end

  #Returns the current logged-in user (if any)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
