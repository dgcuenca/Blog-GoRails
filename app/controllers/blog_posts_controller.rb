class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, except: [:index, :new, :create] #only: [:show, :edit, :update, :destroy]

  def index
    #instance variable are used because rails can use these in .erb template
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
  end

  def show
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy # IN tutorial said this dont fail this should work , always destroy should work ...
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :published_at)
  end

  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
  end
end