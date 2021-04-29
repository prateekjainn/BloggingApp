require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before(:each) do
    @user = create(:user)
    login_as(@user)
    @article = create(:article, user: @user)
  end
  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  context "POST #create" do
    it 'should create a new article' do
      expect(@article).to be_valid
    end
  end

  context "GET #show" do
    it 'should get a particular article' do
      get :show, params: { id: @article.to_param }
      expect(response).to have_http_status(:success)
    end
  end

  context "PUT #update" do
    it "should update the title" do
      put :update, params: { id: @article.id, article: { title: nil } }
      p response
      expect(response.status).to eq(200)
    end
    it "should update the description" do
      put :update, params: { id: @article.id, article: { title: Faker::String.random } }
      expect(response.status).to eq(200)
    end
  end
  context "destroy" do
    it "should delete the article" do
      delete :destroy, params: { id: @article.id }
      p @article
      p response
      # expect(response).to have_http_status(:success)
      expect(response).to redirect_to articles_path
    end
  end
end
