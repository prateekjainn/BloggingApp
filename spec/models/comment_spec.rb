require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "associations" do    
    it "belongs to article" do
      t = Like.reflect_on_association(:post)
      expect(t.macro).to eq(:belongs_to)
    end

  end
end
