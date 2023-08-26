# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a name and email" do
    # user = User.new(name: "Example User", email: "user@example.com")
    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    
    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')

    expect(first_post).to be_valid
  end

  
end
