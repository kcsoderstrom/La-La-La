class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.is_password?(params[:user][:password])
      login_user!(@user)
      redirect_to bands_url
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
    redirect_to bands_url
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end