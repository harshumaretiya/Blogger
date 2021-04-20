class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :require_login, except: [:index, :show]

  def index
    @articles = Article.all
    @most_popular = Article.order('view_count DESC').first(3)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
    @article.increase_view_count
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.author_id != current_user.id
      flash.notice = "You don't have permissions to delete this article"
      redirect_to article_path(@article)
    else
      @article.destroy
      flash.notice = "Article '#{@article.title}' Deleted!"
      redirect_to articles_path
    end
  end

  def edit
    @article = Article.find(params[:id])
    unless @article.author_id == current_user.id
      flash.notice = "You don't have permissions to edit this article"
      redirect_to article_path(@article)
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end
end
