class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def show
    @post_book = Book.find(params[:id])
  end

  def destroy
    @post_book = Book.find(params[:id])
    @post_book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :opnion)
  end
end
