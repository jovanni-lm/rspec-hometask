# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'with a published attribute' do
    let(:post) do
      Post.new(title: 'some testing',
               body: 'lorem ipsum dolor',
               user_id: 1)
    end

    let(:post_published) do
      Post.new(title: 'some testing',
               body: 'lorem ipsum dolor',
               user_id: 1,
               published: true)
    end

    it 'should be unpublished when post created' do
      expect(post).to_not be_published
    end

    describe '.publish' do
      context 'when publish' do
        before { post.publish }
        it { expect(post).to be_published }
      end
    end

    describe '.unpublish' do
      context 'when unpublish' do
        before { post_published.unpublish }
        it { expect(post_published).to_not be_published }
      end
    end
  end
end
