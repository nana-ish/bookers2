class UsersController < ApplicationController
before_action :authenticate_user!


  def show
     @user = User.find(params[:id])
     @books = @user.books
     @users = User.all
     @book = Book.new
  end

     # 投稿データの保存
  def create
    @user = User.new(user_params)
    @user_id = current_user.id
    redirect_to user_path(@user_id)
  end


  def edit
    @user =User.find(params[:id])
  end


  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def index
     @user=current_user
     @book=Book.new
     @users = User.all
  end

  def destroy
     user= User.find(params[:id])
     user.destroy
     redirect_to books_path
  end

# 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction	)
  end


end
