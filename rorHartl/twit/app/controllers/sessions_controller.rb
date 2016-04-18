class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #what does authenticate do?
    binding.pry
    if user && user.authenticate(params[:session][:password])
      #Log the user in and redirect to the user's show page
      log_in user
      #below we check if in the sign in section, the box remember me has been checked
      # if yes, value will be 1 and remember(user) helper method will be called
      # if not, value will be 0 and forget(user) will be called
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      redirect_to user #rails automatically converts this to user_url(user)
    else
      #create an error message 
      #at first i'd type flash[:erro] and the red background did not show up
      #meaning that :danger is a keyword -- bootstrap probably!
      flash.now[:danger] = "Invalid email/password combination" #not quite right
      render 'new'
    end
  end

  def destroy 
    #how does destroy action know what log_out is?
    #to answer above Q, log_out is a method in the sessions_helper.rb
    log_out if logged_in? #logged_in? is a method defined in sessions_helper
    # log_out
    redirect_to root_url
  end
end
