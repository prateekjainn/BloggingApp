require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before(:each) do
    # @user = create(:user)
    # p @user
    # login_as(@user)
    # @article = create(:article, user: @user)
    # p @article
    @article=Article.find(105)
  end
  context "POST #create" do
    it 'should add a like to article' do
      # @article.likes.create(user_id: @article.user_id)
      @likes=create(:like)
      # @likes=create(:like, article: @article, user: @article.user_id)
      p @response
      expect(response).to be_successful
    end
  end
end