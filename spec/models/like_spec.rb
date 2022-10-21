require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Alex', photo: 'photo.png', bio: 'Love solving problems')
  post = Post.new(author: user, title: 'Title', text: 'Text')
  subject { Like.new(author: user, post:) }

  before { subject }

  it 'author is nil' do
    test_case = subject
    test_case.author = nil
    expect(test_case).to_not be_valid
  end

  it 'post is nil' do
    test_case = subject
    test_case.post = nil
    expect(test_case).to_not be_valid
  end
end
