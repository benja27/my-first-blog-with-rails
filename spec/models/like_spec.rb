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
# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid Link with author and post' do
    # user = User.new(name: "Example User", email: "user@example.com")

    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')

    like = Like.new(author: first_user, post: first_post)
    expect(like).to be_valid
  end

  # test for increment likes counter
  it 'should increment the likes_counter of the associated post' do
    user = User.create(name: 'Example User')
    post = Post.create(author: user, title: 'Test Post', text: 'This is a test post')

    like = Like.create(author: user, post:)

    expect do
      like.increment_likes_counter
      post.reload
    end.to change(post, :likes_counter).by(1)
  end
end
