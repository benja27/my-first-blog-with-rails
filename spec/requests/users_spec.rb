require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success / includes correct placeholder text / render correct template' do
      get '/users/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('here you can see a list of the users')
      expect(response).to render_template(:index)
    end
  end
  
  describe 'GET /show' do
    it 'returns http success / includes correct placeholder text / render correct template' do
      user = User.create(id: 2, name: 'User Name') # Create a user with ID 2
      get '/users/2' 
      expect(response).to have_http_status(:success)
      expect(response.body).to include('here you can see the info of the user')
      expect(response).to render_template(:show)
    end
  end

end
