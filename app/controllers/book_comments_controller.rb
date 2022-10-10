class BookCommentsController < ApplicationController
  # 下記追加
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    @book_comment.save
    # 解答参照
    # @book = Book.find(params[:book_id])
    # @book_comment = BookComment.new
    # book = Book.find(params[:book_id])
    # comment = current_user.book_comments.new(book_comment_params)
    # comment.book_id = book.id
    # comment.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
    book_comment.destroy
    # 解答参照
    # @book = Book.find(params[:book_id])
    # @book_comment=BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
      # 応用課題6にて削除 不要の為
      # BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
      # コードの修正 上記のコード解答
      # BookComment.find(params[:id]).destroy
  end

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
