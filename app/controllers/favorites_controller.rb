class FavoritesController < ApplicationController
  # 解答参照 下記追加
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(user_id: current_user.id)
    favorite.save
    # 解答参照
    # @book = Book.find(params[:book_id])
    # book = Book.find(params[:book_id])
    # favorite = current_user.favorites.new(book_id: book.id)
    # favorite.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    # 解答参照
    # @book = Book.find(params[:book_id])
    # book = Book.find(params[:book_id])
    # favorite = current_user.favorites.find_by(book_id: book.id)
    # favorite.destroy
  end
end
