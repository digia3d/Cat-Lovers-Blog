require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Tom',
      photo: '/app/assets/images/thumbnail.png',
      bio: 'Teacher from Mexico',
      posts_counter: 2
    )

    User.create(
      name: 'John',
      photo: '/app/assets/images/thumbnail.png',
      bio: 'Teacher from USA',
      posts_counter: 4
    )

    @post_one = Post.create(
      author: @user1,
      title: 'Hello',
      text: 'This is my test post 1',
      comments_counter: 0,
      likes_counter: 0
    )

    Post.create(
      author: @user1,
      title: 'Hello',
      text: 'This is my test post 2',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.new(author: @user1, post: @post_one, text: 'Testing post index page')
    Comment.new(author: @user1, post: @post_one, text: 'Testing post index page second time')

    @users = User.all
  end

  describe 'views/posts_show' do
    before(:each) { visit user_post_path(@user1, @post_one) }

    it 'should display the post title' do
      expect(page).to have_content @post_one.title
    end

    it 'should display the post author' do
      expect(page).to have_content @post_one.author.name
    end

    it 'should display the post count' do
      expect(page).to have_content("Comments: #{@post_one.comments_counter}")
    end

    it 'should display the post likes count' do
      expect(page).to have_content("Likes: #{@post_one.likes_counter}")
    end

    it 'should display the post comment count' do
      expect(page).to have_content("Comments: #{@post_one.comments_counter}")
    end

    it 'should display the name of commenter' do
      @post_one.comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end

    it 'should display the text of the comment' do
      @post_one.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
