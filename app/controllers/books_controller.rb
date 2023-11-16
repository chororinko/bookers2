class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(current_user.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    # 以下投稿したユーザーのトプ画載せたい

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end




