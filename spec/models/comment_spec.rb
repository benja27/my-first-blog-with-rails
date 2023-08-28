# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.new(name: 'John Doe', posts_counter: 0) }

  it 'is valid comment with a user and a post' do
    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')

    comment = Comment.create(post: first_post, author: first_user, text: 'Hi Tom!')

    expect(comment).to be_valid
  end

  # increment comments counter test

  it 'should increment the comments_counter of the associated post' do
    user = User.create(name: 'Benja')
    post = Post.create(author: user, title: 'Test Post', text: 'This is a test post')

    comment = Comment.create(author: user, post:, text: 'Test comment')

    expect do
      comment.increment_comments_counter
      post.reload
    end.to change(post, :comments_counter).by(1)
  end
end
