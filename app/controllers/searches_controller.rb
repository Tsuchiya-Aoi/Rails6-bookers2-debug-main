class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'User'
      @records = User.search_for(@content, @method)
    else
      @records = Book.search_for(@content, @method)
    end
    # コードの修正
    # @range = params[:range]
    # @word = params[:word]
    # if @range == "User"
      # @users = User.looks(params[:search], params[:word])
    # else
      # @books = Book.looks(params[:search], params[:word])
    # end
  end
end
