class SearchesController < ApplicationController

  def search
    @model = params[:model]
    if @model == "User"
      @users = User.looks(params[:search], params[:content])
      render '/searches/search_result'
    else
      @books = Book.looks(params[:search], params[:content])
      render '/searches/search_result'
    end
  end

end
