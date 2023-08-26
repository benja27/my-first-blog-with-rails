class Post < ApplicationRecord

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :increment_user_posts_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_user_posts_count
    author.increment!(:posts_counter)
  end
  
end
