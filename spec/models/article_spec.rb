require 'rails_helper'

RSpec.describe Article, type: :model do
  context "associations" do
    it "belongs to user " do
      t = Article.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
    it "has many likes" do
      t = Article.reflect_on_association(:likes)
      expect(t.macro).to eq(:has_many)
    end
    it "has many comments" do
      t = Article.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end
  end
  context "validations" do
    before do
      # @user = User.new(username: "Any", email: "Lorem@iss.psum", password: "test")
      @article= create(:article)
      p @article
    end
    it 'has a article id' do
      expect(@article.id).to be_present
    end
    it 'has a title' do
      expect(@article.title).to be_present
    end
    it 'has a description' do
      expect(@article.description).to be_present
    end
    it 'has a user id' do
      expect(@article.user_id).to be_present
    end
    it 'has a username atleast 3 character long and less than 25 characters' do
      expect(@article.title).to have_attributes(size: (be > 2) & (be <= 50)) # passes
    end
    it 'has a username atleast 3 character long and less than 25 characters' do
      expect(@article.description).to have_attributes(size: (be > 9) & (be <= 300)) # passes
    end
  end
end
