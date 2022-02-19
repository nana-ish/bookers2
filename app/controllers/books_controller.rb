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
    @books = Book.all
    @user = current_user
    @book = Book.new

  end

  def show
    @book = Book.new
    @bookdetail = Book.find(params[:id])
    @books = Book.all
    @user = @bookdetail.user
  end


  def edit
     @book = Book.find(params[:id])
  end
  
  

  def destroy
    book= Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
