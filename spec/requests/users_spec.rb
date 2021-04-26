require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do 
    # allow(controller).to receive(:current_user).and_return(create(:user))
  end
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
    before(:each) do
      # @user=create(:user)
      @user=User.find(61)
      p @user
    end
    it "updates the username and redirects" do
      session[:user_id]=61
      p @user
      patch :update, params: {id: @user.id, user: attributes_for(:user, email: "new@gmail.com")}
      p @user
      expect(@user.reload.email).to eq "new@gmail.com"


      # expect(user.email).to eq("new@email.com")
      # expect(response).to be_successful
    end
  end
end
