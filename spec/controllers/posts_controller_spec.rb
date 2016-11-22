require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_attributes) {
    { title: 'some testing', body: 'lorem ipsum dolor', user_id: 1 }
  }
  let(:post) { Post.create! valid_attributes }

  describe 'GET #publish' do

    it 'should become published when publish action called' do
      get :publish, params: { id: post.to_param, user_id: post.user_id }

      expect(assigns(:post).published).to eq(true)
    end

    it 'should become unpublished when unpublish action called' do
      post = Post.create( { title: 'some testing',
                            body: 'lorem ipsum dolor',
                            user_id: 1,
                            published: true} )

      get :unpublish, params: { id: post.to_param, user_id: post.user_id }

      expect(assigns(:post).published).to be_falsey
    end
  end

  describe 'with a published and user_id attribute' do
    it 'should become published when publish method called with correct user_id' do
      get :publish, params: { id: post.to_param, user_id: post.user_id }

      expect(assigns(:post).published).to eq(true)
    end

    it 'should show error when user_id is not correct' do
      get :publish, params: { id: post.to_param, user_id: post.user_id + 100 }

      expect(flash.notice).to eq('You do not have access to publish action')
    end

    it 'should not become published when user_id is not correct' do
      get :publish, params: { id: post.to_param, user_id: post.user_id + 100 }

      expect(assigns(:post).published).to eq(false)
    end

    it 'should redirect to homepage when user_id is not correct' do
      get :publish, params: { id: post.to_param, user_id: post.user_id + 100 }

      expect(response).to redirect_to(root_path)
    end
  end
end
