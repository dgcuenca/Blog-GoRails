class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence:true

  # scope enable to use BlogPost.draft 
  scope :draft, -> { where(published_at: nil) }
  # Use staby lambda in order to evaluate everytime we make a querry for example when we do BlogPost.scheduled
  #If not Time.current is going to take the value of the first query and dont change after that
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }
end
