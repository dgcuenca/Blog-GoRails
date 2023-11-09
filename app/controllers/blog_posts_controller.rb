class BlogPostsController < ApplicationController
  def index
    #instance variable are used because rails can use these in .erb template
    @blog_posts = BlogPost.all
  end
end