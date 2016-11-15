require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'with a published attribute' do
    before(:all) do
      @post = Post.new(title: 'some testing', body: 'lorem ipsum dolor', user_id: 1)
      expect(@post).to be_valid
    end

    it 'should be unpublished when post created' do
      expect(@post).to_not be_published
    end

    it 'should become published when publish method called' do
      @post.publish
      expect(@post).to be_published
    end

    it 'should become unpublished when unpublish method called' do
      post = Post.new(title: 'some testing',
                      body: 'lorem ipsum dolor',
                      user_id: 1,
                      published: true)

      post.unpublish
      expect(post).to_not be_published
    end
  end
end
