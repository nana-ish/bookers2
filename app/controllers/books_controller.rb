class BooksController < ApplicationController
  def new

  end

    # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @book=Book.new
  end

  def show
    @book=Book.new
    @books=Book.all
  end

  def edit
  end

  def destroy
  end


  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
