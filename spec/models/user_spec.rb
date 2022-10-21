require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Alex', photo: 'photo.png', bio: 'Love solving problems') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'photo should be present' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'bio should be present' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should br greater or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#recent_posts' do
    before { 5.times { |_post| Post.create(author: subject, title: "Title #{post}") } }

    it 'should return the 3 most recent posts' do
      expect(subject.recent_posts).to eq(subject.posts.last(3))
    end
  end
end
