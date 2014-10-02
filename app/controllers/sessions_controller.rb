class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @url = session[:url]
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.is_password?(params[:user][:password])
      login_user!(@user)
      if @url
        redirect_to @url
      else
        redirect_to tracks_url
      end
    else
      @user = User.new
      @user.email = params[:user][:email]
      render :new
    end
  end

  def destroy
    flash[:message] = "Goodbye"
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end