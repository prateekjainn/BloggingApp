require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before(:each) do
    @user = create(:user)
    login_as(@user)
  end
  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  context "POST #create" do
    before(:all) do
      @article = create(:article)
    end
    it 'should create a new article' do
      expect(@article).to be_valid
    end
  end

  context "PUT #update" do
    before do
      @article = create(:article, user: @user)
    end
    it "should update the title" do
      put :update, params: { id: @article.id, article: { title: "new title" } }
      expect(response.status).to eq(200)
    end
    it "should update the description" do
      put :update, params: { id: @article.id, article: { title: Faker::String.random } }
      expect(response.status).to eq(200)
    end
  end
  context "destroy" do
    before do
      login_as(@user)
      @article = create(:article, user: @user)
    end
    it "should delete the article" do
      delete :destroy, params: { id: @article.id }
      p @article
      p response
      # expect(response).to have_http_status(:success)
      expect(response).to redirect_to articles_path
    end
  end
end
