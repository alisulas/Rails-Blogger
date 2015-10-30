class ArticlesController < ApplicationController
  before_action :find_article, except: [:index, :new, :create]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article successfully created"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "Article was successfully deleted"
      redirect_to @articles_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @articles_path
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def find_article
      @article = Article.find(params[:id])
    end

end
