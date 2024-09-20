class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, except: [:index, :show]

  def index
    @themes = Theme.all
  end

  def show
    @articles = @theme.articles
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to @theme, notice: 'Theme created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @theme.update(theme_params)
      redirect_to @theme, notice: 'Theme updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @theme.destroy
    redirect_to themes_url, notice: 'Theme deleted successfully.'
  end

  private

  def set_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:name)
  end

  def authorize_admin
    # Implement admin authorization logic here
    # For example, using CanCanCan:
    # authorize! :manage, Theme
  end
end