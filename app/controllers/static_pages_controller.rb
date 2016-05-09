class StaticPagesController < ApplicationController

  def home
    @posts = current_user.posts.all.order("updated_at desc")
    @activities = PublicActivity::Activity.order("created_at desc")
  end
end
