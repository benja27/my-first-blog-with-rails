# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with a name and email' do
    first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')

    expect(first_post).to be_valid
  end

  it 'is valid with an author, title, and text' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author: user, title: 'Hello', text: 'This is my first post')

    expect(post).to be_valid
  end

  it 'is not valid without an author' do
    post = Post.new(title: 'Hello', text: 'This is my first post')
    expect(post).not_to be_valid
  end

  it 'is not valid without a title' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author: user, text: 'This is my first post')
    expect(post).not_to be_valid
  end

  it 'belongs to an author' do
    association = described_class.reflect_on_association(:author)
    expect(association.macro).to eq :belongs_to
  end
end
