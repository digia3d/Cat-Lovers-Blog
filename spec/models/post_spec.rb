require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Alex', photo: 'photo.png', bio: 'Love solving problems')
  subject { Post.new(author: user, title: 'Title', text: 'Text') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'author should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  describe 'should test methods in post model' do
    it 'post should have five recent comments' do
      expect(subject.recent_comments).to eq(subject.comments.last(5))
    end
  end
end
