class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]

  def index
    @users  = User.all
    authorize @users
  end

  def new
    redirect_to new_user_registration_path
  end

  def show
    authorize @user
  end

  def edit
    if user_signed_in?
      redirect_to edit_user_registration_path
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:fname, :email, :dname)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
