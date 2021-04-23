require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    it "belongs to user role" do
      t = User.reflect_on_association(:user_role)
      expect(t.macro).to eq(:belongs_to)
    end

    it "should have many articles" do
      t = User.reflect_on_association(:articles)
      expect(t.macro).to eq(:has_many)
    end

    it "has many likes" do
      t = User.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end
  end

  context "validations" do
    before do
      # @user = User.new(username: "Any", email: "Lorem@iss.psum", password: "test")
      @user= create(:user)
      p @user
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it 'has a username' do
      expect(@user.username).to be_present
    end

    it 'has a email' do
      expect(@user.email).to be_present
    end

    it 'has a password' do
      expect(@user.password).to be_present
    end
    it 'has a user role' do
      expect(@user.role_id).to be_present
    end

    it 'has a username atleast 3 character long and less than 25 characters' do
      expect(@user.username).to have_attributes(size: (be > 2) & (be <= 25)) # passes
    end
  end
end
