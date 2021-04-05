# frozen_string_literal: true

# class usercontroller
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]
  before_action :authorize_user, only: [:show]

  def index
    @users = User.all.where(admin: false)
    authorize @users
  end

  def new
    redirect_to new_user_registration_path
  end

  def show; end

  def edit
    if user_signed_in?
      redirect_to edit_user_registration_path
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize_user
    if @user.destroy
      flash[:alert] = 'Your Account has been deleted Successfully..!!'
      redirect_to root_path
    else
      flash[:alert] = 'Error: account not deleted..!!'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:fname, :email, :dname)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    authorize @user
  end
end
