require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    author = User.create(name: 'Alex', photo: 'photo.png',bio: 'Love solving problems', posts_counter: 0)
    post = Post.create(author: author, title: 'Title', text: 'Text', likes_counter: 0, comments_counter: 0)
    subject { described_class.new(author: author, post: post, text: 'Text') }

    before { subject.save }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an author' do
      subject.author = nil
      expect(subject).to_not be_valid
    end
  end
end