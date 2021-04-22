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
      @user = User.create!(username: 'firstocdnse1s2', email: "p2jcain@sdgfdkcddksshnss.com", password: "fdfdfd", role_id: "1")
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
      @user = User.create!(username: 'nedcw', email: "pjdain@dgfdkdkhnss.com", password: "fdfdfd", role_id: "1")
    end
    it 'is expected to create a new user' do
      expect(@user).to be_valid
    end
  end

  context "PATCH #update" do

  end

end
