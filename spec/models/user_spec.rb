# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  name          :string
#  photo         :string
#  bio           :text
#  posts_counter :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { described_class.new }

  it 'is valid with a name and email' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    expect(user).to be_valid
  end

  it 'is valid with a present name' do
    user.name = 'Example Name'
    expect(user).to be_valid
  end

  it 'is not valid without a present name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid if posts_counter is not an integer' do
    user.posts_counter = 1.5
    expect(user).not_to be_valid
  end

  it 'returns the most recent posts' do
    user = User.new(name: 'John Doe', posts_counter: 0)
    user.save

    post1 = Post.new(title: 'My Post Title', text: 'This is the content of the post.', comments_counter: 0,
                     likes_counter: 0, author: user)
    post1.save
    post2 = Post.new(title: '#1 My Post Title', text: 'This is the content of the post.', comments_counter: 0,
                     likes_counter: 0, author: user)
    post2.save
    post3 = Post.new(title: '#2 My Post Title', text: 'This is the content of the post.', comments_counter: 0,
                     likes_counter: 0, author: user)
    post3.save

    expect(user.recents_posts).to eq([post3, post2, post1])
  end
end
