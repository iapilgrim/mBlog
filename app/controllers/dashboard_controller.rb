# It is kind of mashup for all different content on Blog
class DashboardController < ApplicationController
  def index
    @articles = Article.all
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end
end
