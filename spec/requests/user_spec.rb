require 'spec_helper'

describe User do
  describe 'GET /users.json' do
    before do
      @user1 = FactoryGirl.create(:user1)
      @user2 = FactoryGirl.create(:user2)
      get '/users.json'
    end

    it 'should return 200' do
      expect(response).to be_success
    end

    it 'should return users' do
      json = JSON.parse(response.body)
      expect(json.size).to be > 0
    end
  end

  describe 'GET /users/:id.json' do
    before do
      @user1 = FactoryGirl.create(:user1)
      get '/users/1.json'
    end

    it 'should return 200' do
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'should return user1' do
      json = JSON.parse(response.body)
      expect(json['name']).to eq @user1.name
    end
  end

  describe 'POST /users.json' do
    let(:path) { '/users.json' }

    before do
      @params = { user: FactoryGirl.attributes_for(:user1) }
    end

    it 'should return 201' do
      post path, @params
      expect(response).to be_success
      expect(response.status).to eq 201
    end

    it 'should return user1' do
      post path, @params
      json = JSON.parse(response.body)
      expect(json['name']).to eq @params[:user][:name]
    end

    it 'should increase users count' do
      expect do
        post path, @params
      end.to change(User, :count).by 1
    end
  end

  describe 'PUT /users/:id.json' do
    before do
      @user1 = FactoryGirl.create(:user1)
      @params = { user: { name: 'updated name' } }
      put '/users/1.json',  @params
    end

    it 'should return 200' do
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'should modify user name' do
      json = JSON.parse(response.body)
      expect(json['name']).to eq @params[:user][:name]
    end
  end

  describe 'DELETE /users/:id.json' do
    let(:path) { '/users/1.json' }

    before do
      FactoryGirl.create(:user1)
    end

    it 'should return 204' do
      delete path
      expect(response).to be_success
      expect(response.status).to eq 204
    end

    it 'should decrease users count' do
      expect do
        delete path
      end.to change(User, :count).by -1
    end
  end
end
