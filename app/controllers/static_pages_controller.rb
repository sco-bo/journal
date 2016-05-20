class StaticPagesController < ApplicationController

  def home
    @posts = current_user.posts.all.paginate(page: params[:posts_page], per_page: 15).order("updated_at desc")
    @activities = PublicActivity::Activity.paginate(page: params[:activities_page], per_page: 10).order("created_at desc")
  end
end
