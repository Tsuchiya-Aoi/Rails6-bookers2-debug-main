class ApplicationController < ActionController::Base
  # 下記のコード削除 usersとbooksコントローラにbefore_action :authenticate_user!を記述する
  # before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    user_path(resource)
    #コードの修正 (resource)はログインフォームに入力されたユーザー、(current_user)はログインしているユーザー
    # user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
