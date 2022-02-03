# frozen_string_literal: true

RSpec.describe ActiveRecord::AutoWritable do
  describe '.all' do
    it 'is connected to default role' do
      Post.create!
      ApplicationRecord.connected_to(role: :reading) do
        expect(Post.all.to_a).to be_empty
      end
    end
  end

  describe '.create' do
    it 'is connected to writable role' do
      ApplicationRecord.connected_to(role: :reading) do
        expect { Post.create! }.not_to change(Post, :count)
      end
    end
  end

  describe '.destroy' do
    it 'is connected to writable role' do
      post = Post.create!
      ApplicationRecord.connected_to(role: :reading) do
        post.destroy!
      end
      expect(Post.where(id: post.id)).to be_empty
    end
  end
end
