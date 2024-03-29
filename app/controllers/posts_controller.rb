class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(post_params)
    @post.save
  end

  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end