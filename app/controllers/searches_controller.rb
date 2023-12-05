class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
		@content = params[:content]
		@search = params[:search]
    if @model == "User"
      @users = User.looks(@content, @search)
      render '/searches/search_result'
    else
      @books = Book.looks(@content, @search)
      render '/searches/search_result'
    end
  end

end
