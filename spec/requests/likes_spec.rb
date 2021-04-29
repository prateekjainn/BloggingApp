require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before(:each) do
    @user = create(:user)
    @article = create(:article, user: @user)
  end

  context "POST #create" do
    it 'should add a like to an article' do
      @likes = Like.create(article_id: @article.id, user_id: @article.user_id)
      expect(response).to be_successful
    end
  end
end
