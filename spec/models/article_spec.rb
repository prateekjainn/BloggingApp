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
end
