class ArticleApprovalsController < ApplicationController
  before_action :set_article_approval, only: [:show, :edit, :update, :destroy]
  before_action :require_mod or :require_admin

  def index
    @article_approvals = @article_approvals
    @article_approvals = ArticleApproval.where(status: 'pending')
  end

  def show
  end

  def update
    if @article_approval.update(article_approval_params)
      @article_approval.article.update(status: @article_approval.status)
      redirect_to @article_approval.article, notice: 'Article approval status updated.'
    else
      render :edit
    end
  end

  private

  def set_article_approval
    @article_approval = ArticleApproval.find(params[:id])
  end

  def article_approval_params
    params.require(:article_approval).permit(:status, :approved_by_id)
  end

  def authorize_moderator
    # Implement moderator authorization logic here
    # For example, using CanCanCan:
    # authorize! :manage, ArticleApproval
  end
end