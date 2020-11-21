class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
     if book.update(book_params)
       flash[:notice] = "successfully"
       redirect_to books_path
     end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @user_info = current_user
    @book_new = Book.new
  end


  def show
    @post_book = Book.find(params[:id])
    @book_new = Book.new
    @user_info = User.find(@post_book.user.id)
  end

  def destroy
    @post_book = Book.find(params[:id])
    @post_book.destroy
    if @post_book.destroy
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      redirect_to books_path
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
