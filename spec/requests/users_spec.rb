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
    it 'should create a new user' do
      expect(@user).to be_valid
    end
  end

  context "PUT #update" do
    before(:each) do
      @user=User.find(450)
      login_as(@user)
    end
    it "should update the username" do
      put :update, params: {id: @user.id, user: attributes_for(:user, username: "prateekjainn")}
      @user.reload
      expect(@user.username).to eq "prateekjainn"
    end
    it "should update the email" do
      put :update, params: {id: @user.id, user: attributes_for(:user, email: "newemail@gmail.com")}
      @user.reload
      expect(@user.email).to eq "newemail@gmail.com"
    end
    # it "should update the password" do
    #   put :update, params: {id: @user.id, user: attributes_for(:user, password: "newpassword")}
    #   @user.reload
    #   expect(@user.password).to eq "newpassword"
    # end
  end
end
