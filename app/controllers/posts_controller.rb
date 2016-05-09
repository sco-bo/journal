class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      @post.create_activity :create, owner: current_user if !@post.private?
      flash[:success] = "Post created!"
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
    else
      render :edit
    end
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.create_activity :destroy, owner: current_user if !@post.private
    @post.destroy
    flash[:success] = "Post deleted" 
    redirect_to :authenticated_root
  end

  private

    def post_params
      params.require(:post).permit(:body, :private, :crypt)
    end
end
