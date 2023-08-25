class Post < ApplicationRecord

  belongs_to :author, class_name: 'User' 
  has_many :comments
  has_many :likes 
  
  after_create :increment_user_posts_count 
  

  def increment_user_posts_count
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

end
