require 'rails_helper'

RSpec.describe Like, type: :model do
  context "associations" do
    it "has many user" do
      t = Like.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it "belongs to post " do
      t = Like.reflect_on_association(:post)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
