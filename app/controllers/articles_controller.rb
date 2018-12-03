class ArticlesController < ApplicationController 
  
  def index
    @articles = Article.all
  end 

  def show
    @article = Article.find(param[:id])
  end
  
  def new 
    @article = Article.new
  end 
  
  def edit 
    @article = Article.find(params[:id]) 
  end 
  
  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    
    else
      render 'new'
    end
  end 
  
  private 
  
  def article_params
    params.require(:article).permit(:title, :description)
    
  end 


end 
