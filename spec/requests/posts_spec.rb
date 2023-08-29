require 'rails_helper'

RSpec.describe 'Posts', type: :request do

  let(:user) { User.create(name: 'Heather', photo: 'https://images.unsplash.com/photo', bio: 'young beauty woman.') }
  let(:post) { Post.create(author: user, title: 'sample title', text: 'sample post') }
  
  describe 'GET /users/:id/posts' do
    it 'renders the corresponding list of posts of a given user' do
      get user_posts_path(user)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)      
      expect(response.body).to include('posts') 
    end
  end

  describe 'GET /users/:id/posts/:id' do
    it 'renders the show template and includes placeholder text' do
      get user_post_path(user, post)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)      
      expect(response.body).to include('here you can find the post itself') 
    end
  end
  
end
