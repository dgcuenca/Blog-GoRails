class BlogPosts::CoverImagesController < ApplicationController
  #in order to use helper dom_id()
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_blog_post

  def destroy
    @blog_post.cover_image.purge_later
    #not redirect in order to not lose data not saved in the form and only delete cover image
    #keep this for any browser dont have JS enable
    respond_to do |format|
      format.html { redirect_to edit_blog_post_path(@blog_post) }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@blog_post, :cover_image))}
    end
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])# here is not only id because is nested in any case you can always check how find correctly using rails routes
  end
end
