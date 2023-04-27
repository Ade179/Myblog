require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'assigns @users' do
      user1 = User.create(name: 'John', photo: 'https://example.com/photo1.jpg', bio: 'Some bio', posts_counter: 0)
      user2 = User.create(name: 'Jane', photo: 'https://example.com/photo2.jpg', bio: 'Some other bio',
                          posts_counter: 0)
      get '/users'
      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

  describe 'GET /users/:id' do
    it 'returns http success' do
      user = User.create(name: 'John', photo: 'https://example.com/photo1.jpg', bio: 'Some bio', posts_counter: 0)
      get "/users/#{user.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      user = User.create(name: 'John', photo: 'https://example.com/photo1.jpg', bio: 'Some bio', posts_counter: 0)
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'assigns @user' do
      user = User.create(name: 'John', photo: 'https://example.com/photo1.jpg', bio: 'Some bio', posts_counter: 0)
      get "/users/#{user.id}"
      expect(assigns(:user)).to eq(user)
    end
  end
end
