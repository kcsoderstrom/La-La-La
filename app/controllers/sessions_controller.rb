class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(*user_params.values)
    if @user
      #redirect_to user_url(@user)
      login_user!(user)
    else
      @user = User.new
      @user.user_name = user_params[:user_name]
      render :new
    end
  end

  def destroy
    flash[:message] = "Goodbye #{current_user.user_name}, :("
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to cats_url
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end