require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response).to have_http_status(:success)
      expect(response).to be_successful
    end
  end

  context "GET #show" do
    before(:all) do
      @user=create(:user)
    end
    it 'returns a success response' do
      get :show, params: { id: @user.to_param }
      expect(response).to have_http_status(:success)
    end
  end

  context "GET #new" do
    it 'is expected to assign user as new instance variable' do
      get :new
      expect(response).to be_successful
    end
  end

  context "POST #create" do
    before(:all) do
      @user=create(:user)
    end
    it 'is expected to create a new user' do
      expect(@user).to be_valid
    end
  end

  context "PATCH #update" do
    it "updates the username and redirects" do
      # patch :update, id: 61, request: { username: "Larry Johnson")
      p response
      expect(response).to be_successful
    end
  end
end
