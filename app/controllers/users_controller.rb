class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :userimage)
  end
end
