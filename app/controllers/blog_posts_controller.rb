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

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new
    end
  end 

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end