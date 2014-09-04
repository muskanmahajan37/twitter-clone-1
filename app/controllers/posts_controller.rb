class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.js
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params[:post])
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

private

  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end

end
