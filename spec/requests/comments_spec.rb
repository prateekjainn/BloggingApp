require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  context "POST #create" do
    before(:all) do
      @comment = create(:comment)
      p @comment
    end
    it 'should create a new comment' do
      expect(@comment).to be_valid
    end
  end
end
