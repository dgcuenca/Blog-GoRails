class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence:true
  
  # if some post has same date of publish then sorted by update
  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc)}

  # scope enable to use BlogPost.draft 
  scope :draft, -> { where(published_at: nil) }
  # Use staby lambda in order to evaluate everytime we make a querry for example when we do BlogPost.scheduled
  #If not Time.current is going to take the value of the first query and dont change after that
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  # helper methods to be use in view templates
  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
