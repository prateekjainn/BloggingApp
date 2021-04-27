require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  # before (:each) do 
  #   allow(controller).to receive(:current_user).and_return(create(:user))
  #   session[:user_id]=61
  # end
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
    before(:all) do
      # @user = User.find(session[:user_id])
      # @article.user_id=session[:user_id]
      @user = create(:user)
      @article = FactoryBot.create(:article ,user: @user)
      # @request.env['devise.mapping'] = Devise.mappings[:user]
      # sign_in :user, user

    end
    it "updates the title" do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      # sign_in :user, @user
      # put :update, params: {id: @article.id, article: attributes_for(:article, title: "wewcom")}
      put :update, params: {id: @article.id,  article: {title: "wewcom"}}
      p response
      p @article
      expect(response.status).to eq(200)
    end
  end
  context "destroy" do
    
  end
end
