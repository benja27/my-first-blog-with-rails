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
end
