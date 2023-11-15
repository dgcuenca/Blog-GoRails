require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    #binding.irb
    #assert avaluates if something is true
    #assert draft_blog_post.draft? 
    #Using fixture helper method the name is the one that come from the file in fixtures the .yml file
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for published blog post" do
    #refute evaluates if something is false
    #refute published_blog_post.draft?
    refute blog_posts(:published).draft?
  end

  test "draft? returns false for scheduled blog post" do
    #refute scheduled_blog_post.draft?
    refute blog_posts(:scheduled).draft?
  end

  test "published? returns true for published blog post" do
    #assert published_blog_post.published?
    assert blog_posts(:published).published?
  end

  test "published? returns false for draft blog post" do
    #refute draft_blog_post.published? 
    refute blog_posts(:draft).published?
  end

  test "published? returns false for scheduled blog post" do
    #refute scheduled_blog_post.published?
    refute blog_posts(:scheduled).published?
  end

  test "scheduled? returns true for scheduled blog post" do
    #assert scheduled_blog_post.scheduled?
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for draft blog post" do
    #refute draft_blog_post.scheduled?
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? returns false for published blog post" do
    #refute published_blog_post.scheduled?
    refute blog_posts(:published).scheduled?
  end

  # def draft_blog_post
  #   BlogPost.new(published_at: nil)
  # end

  # def scheduled_blog_post
  #   BlogPost.new(published_at: 1.year.from_now)
  # end

  # def published_blog_post
  #   BlogPost.new(published_at: 1.year.ago)
  # end
end
