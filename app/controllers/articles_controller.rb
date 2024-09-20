class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:index, :show]

  def index
    @articles = Article.all
    @articles = @articles.where(theme_id: params[:theme_id]) if params[:theme_id].present?
  end

  def show
    @comment = Comment.new
  end

  def new
    @article = Article.new
    @themes = Theme.all
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      ArticleApproval.create(article: @article, status: 'pending')
      redirect_to @article, notice: 'Article submitted for approval.'
    else
      @themes = Theme.all
      render :new
    end
  end

  def edit
    @themes = Theme.all
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      @themes = Theme.all
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully deleted.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :theme_id)
  end

  def authorize_user
    # Implement authorization logic here
    # For example, using CanCanCan:
    # authorize! :manage, Article
  end
end