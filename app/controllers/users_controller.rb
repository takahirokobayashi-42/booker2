class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.all
    @user_info = @user#Book.find(@user.
    @book_new = Book.new
  end
  def edit
    @user = User.find(params[:id])
    @book_new = Book.new
  end
  def index
    @user = User.all
    @user_info = current_user
    @book_new = Book.new
  end
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to books_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
