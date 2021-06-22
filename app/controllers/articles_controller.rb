class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = policy_scope(Article).order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end
end
