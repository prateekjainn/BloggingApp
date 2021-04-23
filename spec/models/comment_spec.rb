require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "associations" do
    it "belongs to article" do
      t = Like.reflect_on_association(:post)
      expect(t.macro).to eq(:belongs_to)
    end
    context "validations" do
      before(:all) do
        # @comment = Comment.create(body: "Dddddddddddddddddd", article_id: "105")
        @comment= create(:comment)
        p @comment
      end
      it 'has a article id' do
        expect(@comment.article_id).to be_present
      end
      it 'has a body' do
        expect(@comment.body).to be_present
      end
    end
  end
end
