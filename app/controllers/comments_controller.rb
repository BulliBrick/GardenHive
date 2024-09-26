class CommentsController < ApplicationController
  before_action :set_article
  before_action :require_user

  def index
    @comments = @comments
  end

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @article, notice: 'Comment added successfully.'
    else
      redirect_to @article, alert: 'Failed to add comment. error: ' + @comment.errors.full_messages.join(', ')
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end