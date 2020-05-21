class CommentsController < ApplicationController

  def create
  	@article = Article.find(params[:article_id]) #find the articles with the associated article_id
  	@comment = @article.comments.create(comment_params) #creates the comment on the article passing in params
  	@comment.save!

  	redirect_to article_path(@article)
  end

  def destroy
  	@article = Article.find(params[:article_id])

  	@comment = @article.comments.find(params[:id])
    @comment.soft_destroy

    redirect_to article_path(@article)
  end

  private

  def comment_params
  	params.require(:comment).permit(:name, :response)
  end
end
