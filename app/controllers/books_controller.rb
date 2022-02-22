class BooksController < ApplicationController

before_action :correct_user, only: [:edit, :update]

  def show
    @book = Book.new
    @bookdetail = Book.find(params[:id])
    @books = Book.all
    @user = @bookdetail.user
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

      if @book.save
        flash[:notice]="Book was successfully created."
        redirect_to book_path(@book)
      else
         @books = Book.all
         @user = current_user
        render :index       #同じコントローラー内の別のアクションに飛ぶ
        
      end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def edit
     @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    @book.update(book_params)

     if @book.save
       flash[:notice]="Book was successfully edited."
       redirect_to book_path(@book)
     else
        render :edit
     end

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

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end

end
