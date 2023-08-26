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
end
