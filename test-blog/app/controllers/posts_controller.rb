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
      redirect_to posts_path
    else
      @errors = @post.errors.full_messages
      render 'new'
    end
  end

  def show
    binding.pry
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "Post successfully destroyed"
    redirect_to root_path
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.assign_attributes(post_params)
    if @post && @post.save
      redirect_to post_path(@post)
    else
      @errors = @post.errors
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
