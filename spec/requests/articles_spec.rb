require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before :each do 
    allow(controller).to receive(:current_user).and_return(create(:user))
    session[:user_id]=61
  end
  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  context "POST #create" do
    before(:all) do
      @article=create(:article)
    end
    it 'is expected to create a new article' do
      expect(@article).to be_valid
    end
  end
  
  context "PATCH #update" do
    before do
      @user = User.find(session[:user_id])
      @article = FactoryBot.create(:article)
    end
    it "updates the username and redirects" do
      patch :update, params: {id: @article.id, article: attributes_for(:article, title: ".com")}
      expect(@article.reload.title).to eq ".com"
    end
  end
end
