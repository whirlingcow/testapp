class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
      @articles = Article.all
  end

  def show
      @articles = Article.find(params[:id])
  end

  def new
      @article = Article.new
  end

  def articles_params
      params.require(:article).permit(:title, :content)
  end

  def create
    @article = current_user.articles.build(articles_params)
    if @article.save
      flash[:success] = "Article created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def edit
      @article = Article.find(params[:id])
  end

  def update
      @article = Article.find(params[:id])
      if @article.update_attributes(articles_params)
          flash[:success] = "Article updated!"
          redirect_to root_url
      else
         render 'static_pages/home'
      end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash[:success] = "Article deleted"
    redirect_to root_url
  end
end
