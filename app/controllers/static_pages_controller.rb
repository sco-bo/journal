class StaticPagesController < ApplicationController

  def home
  end

  def index
    @posts = Post.all 
  end
end
