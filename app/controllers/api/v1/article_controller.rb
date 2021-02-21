class Api::V1::ArticleController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  # after_action :display_article, only: [:show, :update]
  # after_actionの挙動が間違っていないか確認が必要

  def index
    articles = current_user.articles.all
    render json: articles
  end

  def show
    render json: @article
  end

  def create
    article = current_user.articles.create!(article_params)
    render json: article
  end

  def update
    @article.update!(article_params)
    render json: @article
  end

  def destroy
    @article.destroy!
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def display_article
      render json: @article
    end
end
