class LikesController < ApplicationController
  before_action :find_article
  before_action :find_like, only: [:destroy]
  # def create
  #   @article.likes.create(user_id: current_user.id)
  #   redirect_to article_path(@article)
  # end
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @article.likes.create(user_id: current_user.id)
    end
    redirect_to article_path(@article)
  end

  def destroy
    if !already_liked?
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to article_path(@article)
  end
  # def create
  #   if @article.present?
  #     @like = Like.new(user_id: current_user.id, article_id: @article.id)
  #     if @like.save
  #       redirect_to article_path(@article), :notice => 'Liked!'
  #     else
  #       redirect_to article_path(@article)
  #       flash[:notice] = "#{  @like.errors.full_messages.each do |message|
  #     end}"

  #     end
  #   else
  #     redirect_to article_path(@article), :alert => 'Invalid post!'
  #   end
  # end
  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_like
    @like = @article.likes.find(params[:id])
  end
end
