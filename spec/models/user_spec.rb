# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name and email' do
    # user = User.new(name: "Example User", email: "user@example.com")
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    expect(user).to be_valid
  end
end
