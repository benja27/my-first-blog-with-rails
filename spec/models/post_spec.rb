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

RSpec.describe Post, type: :model do
  describe '#recent_comments' do
    it 'should return the 5 most recent comments' do
      user = User.create(name: 'Example User')
      post = Post.create(author: user, title: 'Test Post', text: 'This is a test post')

      comments = []

      6.times do |i|
        comments << Comment.create(author: user, post:, text: "Comment #{i + 1}")
      end

      recent_comments = post.recent_comments

      # Verificar que solo se obtengan los 5 comentarios más recientes
      expect(recent_comments.length).to eq(5)
      expect(recent_comments.first).to eq(comments.last)
    end
  end

  describe '#increment_user_posts_count' do
    it 'should increment the posts_counter of the associated user' do
      user = User.create(name: 'Example User')
      post = Post.create(author: user, title: 'Test Post', text: 'This is a test post')

      expect do
        post.increment_user_posts_count
        user.reload
      end.to change(user, :posts_counter).by(1)
    end
  end
end
