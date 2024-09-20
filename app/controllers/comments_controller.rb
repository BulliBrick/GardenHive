class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:update, :destroy]
  before_action :authorize_user, except: [:create]

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @article, notice: 'Comment added successfully.'
    else
      redirect_to @article, alert: 'Failed to add comment.'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @article, notice: 'Comment updated successfully.'
    else
      redirect_to @article, alert: 'Failed to update comment.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @article, notice: 'Comment deleted successfully.'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authorize_user
    # Implement authorization logic here
    # For example, using CanCanCan:
    # authorize! :manage, @comment
  end
end