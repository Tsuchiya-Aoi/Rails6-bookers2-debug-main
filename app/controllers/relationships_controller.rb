class RelationshipsController < ApplicationController
  # 下記のコード
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    # コードの修正 上記のコード解答
    # current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    # コードの修正 上記のコード解答
    # current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # 下記のコード追記
  def followings
    user = User.find(params[:user_id])
		@users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
		@users = user.followers
  end
end
