# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  author_id  :bigint           not null
#  post_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_likes_counter

  def increment_likes_counter
    post.increment!(:likes_counter)
  end
end
