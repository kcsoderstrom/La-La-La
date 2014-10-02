class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index, :adminize]
  before_action :require_permissions, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin
      @users = User.all
      render :index
    else
      render text: "403 FORBIDDEN"
    end
  end

  def show
    if permissions?
      render :show
    else
      render text: "403 FORBIDDEN"
    end
  end

  def new
    @user = User.new
    render :new
  end

  def edit
    if permissions?
      render :edit
    else
      render text: "403 FORBIDDEN"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to tracks_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def update
  end

  def destroy
    if permissions?
      @user.destroy
      redirect_to users_url
    end
  end

  def adminize
    if current_user && current_user.admin
      @user = User.find(params[:user_id])
      @user.update!(admin: true)
      redirect_to users_url
    end
  end

  private
  def require_admin
    if (current_user && !current_user.admin) || current_user.nil?
      redirect_to tracks_url #should I be bothered by a double-redirect?
    end
  end

  def require_permissions
    unless permissions?
      redirect_to tracks_url
    end
  end

  def permissions?
    current_user && (current_user == @user || current_user.admin)
    # @user should be set by set_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
