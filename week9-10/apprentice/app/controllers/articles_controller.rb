class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def show
    if @article
      render json: article_json(@article)
      # render json: @article
    else
      render json: { error: 'Article not found' }, status: :not_found
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: article_json(@article), status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article
      @article.update(article_params)
      render json: article_json(@article)
    else
      render json: { error: 'Article not found' }, status: :not_found
    end
  end

  def destroy
    if @article
      @article.destroy
      render json: { message: "deleted" }
    else
      render json: { error: 'Article not found' }, status: :not_found
    end
  end

  private
    def set_article
      @article = Article.find_by(slug: params[:slug])
    end

    def article_params
      params.require(:article).permit(:title, :description, :body).merge(slug: params['article']['title'].gsub(' ', '-'))
      # params.permit(:title, :description, :body)
    end

    def article_json(article)
      article.as_json(only: [:slug, :title, :description, :body, :created_at, :updated_at])
    end
end
