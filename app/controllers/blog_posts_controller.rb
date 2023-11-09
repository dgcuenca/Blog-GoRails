class BlogPostsController < ApplicationController
  def index
    #instance variable are used because rails can use these in .erb template
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
    #redirect when a post with a specific id was not found
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end