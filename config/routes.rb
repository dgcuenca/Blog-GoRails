Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #routes are reading in order since we have a rescue in blog_post we have to write first the new action
  #otherwise show will take as id "new" and produce an error that redirect to root route.
  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post # enable helpers as blog_post_path blog_post_url also helps write less code, rails conventions
  get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
  post "/blog_posts", to: "blog_posts#create", as: :blog_posts #rails looks for a plural version when try to find a @blog_post without id

  # Defines the root path route ("/")
  root "blog_posts#index"
end
