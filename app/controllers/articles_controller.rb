class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Successfully Created Article"
    redirect_to articles_path
    else
      flash.now[:error] = "Error Creating Article, Title & Body field must be entered"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Successfully Updated Article"
    else
      flash.now[:error] = "Error Updating Article, Title & Body field must be entered"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Successfully Delete Article"
  end

  private 
  def article_params
    params.require(:article).permit(:title, :body)
  end


end
