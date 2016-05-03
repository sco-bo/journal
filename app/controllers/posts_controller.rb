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
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted" 
    redirect_to authenticated_root
  end

  private

    def post_params
      params.require(:post).permit(:body, :private, :crypt)
    end
end
