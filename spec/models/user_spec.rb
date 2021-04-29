require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    it "should belongs to user role" do
      t = User.reflect_on_association(:user_role)
      p t.macro
      expect(t.macro).to eq(:belongs_to)
    end

    it "has many articles" do
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
      @user = create(:user)
      p @user
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it 'should have username' do
      expect(@user.username).to be_present
    end

    it 'should have email' do
      expect(@user.email).to be_present
    end

    it 'should have password' do
      expect(@user.password).to be_present
    end
    it 'should have user role' do
      expect(@user.role_id).to be_present
    end

    it 'should have username atleast 3 character long and less than 25 characters' do
      expect(@user.username).to have_attributes(size: (be > 2) & (be <= 25))
    end
  end
end
