require 'spec_helper'

describe Admin::PostsController do
  describe "admin panel" do
    let(:valid_params) {
      { title: 'this is my title', content: 'this is my content' }
    }
    let(:invalid_params) {
      { is_published: false, funky: 'beats' }
    }
    let(:post) { Post.new(valid_params) }

    it "#index" do
      get :index
      response.status.should eq 200
    end

    it "#new" do
      get :new
      response.status.should eq 200
    end

    context "#create" do
      it "creates a post with valid params" do
        expect{ post }.not_to raise_error
      end
      it "doesn't create a post when params are invalid" do
        expect { Post.new(invalid_params) }.to raise_error
      end
    end

    context "#edit" do
      it "updates a post with valid params" do
        expect {
          post.title = "new title"
          post.save
        }.not_to raise_error
      end
      it "doesn't update a post when params are invalid" do
        expect {
          post.funky = "new title"
          post.save
        }.to raise_error
      end
    end

    it "#destroy" do
      post.save
      delete :destroy, { id: post.id, destroy: post.id }
      expect{Post.find(post.id)}.to raise_error
    end
  end
end
