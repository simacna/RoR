class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    #debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #currently a valid submission returns error because rails convention
      #is to render the corresponding view for create action and there's no create view
      flash[:success] = "Welcome!"
      redirect_to @user 
      #the above is the same as redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
