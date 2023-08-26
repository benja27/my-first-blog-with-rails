# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid comment with a user and a post" do
    
    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')

    comment = Comment.create(post: first_post, author: first_user, text: 'Hi Tom!' )

    expect(comment).to be_valid
  end

  
end
