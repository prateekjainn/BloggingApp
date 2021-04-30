require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = create(:user)
  end
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response).to have_http_status(:success)
      expect(response).to be_successful
    end
  end

  context "GET #show" do
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

    it 'should give unauthorized error if user is not given permission to create client' do
      post :create, params: { user: { username: "dsdsdAdd", email: "dsf@gmail.com", password: "SjjjD" } }
    end

    before do
      login_as(@user)
    end

    it 'should create a new user if values are correct' do
      expect(@user).to be_valid
    end

    it 'should give unprocessable entity error if email is not given' do
      post :create, params: { user: { username: "dsdsdAdd", email: nil, password: "SjjjD" } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if usernamae is not given' do
      post :create, params: { user: { username: nil, email: "new@gmail.com", password: "SjjjD" } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if password is not given' do
      post :create, params: { user: { username: "eshdsdas", email: "new@gmail.com", password: nil } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if email is not correct' do
      post :create, params: { user: { username: "eshdsdas", email: "newgmail.com", password: "DSDS" } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if username is less then 4 character' do
      post :create, params: { user: { username: "ed", email: "new@gmail.com", password: "DSDS" } }
      expect(response.status).to eq(422)
    end
  end

  context "PUT #update" do
    before(:each) do
      @user = User.find(62)
      login_as(@user)
    end

    it "should update the username" do
      put :update, params: { id: @user.id, user: attributes_for(:user, username: "prateekjnnn") }
      @user.reload
      expect(@user.username).to eq "prateekjnnn"
    end

    it "should update the email" do
      put :update, params: { id: @user.id, user: attributes_for(:user, email: "newmail@gmail.com") }
      @user.reload
      expect(@user.email).to eq "newmail@gmail.com"
    end

    it 'should give unprocessable entity error if username is not given' do
      put :update, params: { id: @user.id, user: { username: nil } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if email is not given' do
      put :update, params: { id: @user.id, user: { email: nil } }
      expect(response.status).to eq(422)
    end
    # it "should update the password" do
    #   put :update, params: {id: @user.id, user: attributes_for(:user, password: "newpassword")}
    #   @user.reload
    #   expect(@user.password).to eq "newpassword"
    # end
  end
end
