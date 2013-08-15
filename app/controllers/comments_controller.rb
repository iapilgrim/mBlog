class CommentsController < ApplicationController
	http_basic_authenticate_with :name => "mousse", :password => "mousse", :only => :destroy

	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment]) # This will automatically link the comment so that it belongs to that particular article.
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
end
