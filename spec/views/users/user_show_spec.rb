require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
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

  describe 'views/users_show' do
    before(:each) { visit user_path(@user1) }

    it 'should display the user name' do
      expect(page).to have_content @user1.name
    end

    it 'should display the user bio' do
      expect(page).to have_content @user1.bio
    end

    it 'should display the user posts count' do
      expect(page).to have_content "Number of posts: #{@user1.posts_counter}"
    end

    it 'should display the user posts' do
      expect(page).to have_content @post_one.title
    end

    it 'should display the user first 3 posts' do
      @user1.recent_posts.each do |post|
        expect(page).to have_content post.text
      end
    end

    it 'should display button to Show all posts' do
      within '.showUbtn' do
        expect(page).to have_content 'Show all posts'
      end
    end

    it 'redirects to the post index when is clicked' do
      click_link 'Show all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
