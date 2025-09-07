class SearchesController < ApplicationController

  def search
    @content = params[:content]
    
    @records = Task.search_for(@content)
  end
end
