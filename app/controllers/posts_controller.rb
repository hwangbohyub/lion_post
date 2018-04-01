class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if(@post.save)
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_path
  end

  # method
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:content,:user_id)
  end
end
