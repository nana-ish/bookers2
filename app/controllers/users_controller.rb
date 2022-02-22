class UsersController < ApplicationController

 before_action :ensure_current_user, only: [:edit, :update]

  def show
     @user = User.find(params[:id])
     @books = @user.books
     @users = User.all
     @book = Book.new
  end

     # 投稿データの保存
  def create
    @user = User.new(user_params)
    @user_id = current_user.ids
    redirect_to user_path(@user_id)
  end


  def edit
    @user =User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
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

  def ensure_current_user
    if current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to user_path(current_user)
    end
  end
# 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction	)
  end


end
