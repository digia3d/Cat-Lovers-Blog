require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
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

  describe 'views/posts' do
    before(:each) {visit user_posts_path(@user1)}

    it 'displays users profile photo' do
      expect(page.html).to include('thumbnail.png')
    end

    it 'show users username' do
      expect(page).to have_content @user1.name
    end

    it 'show users number of posts' do
      expect(page).to have_content "Number of posts: #{@user1.posts_counter}"
    end

    it 'displays a post title' do
      expect(page).to have_content @post_one.title
    end

    it 'displays a post text' do
      expect(page).to have_content @post_one.text
    end

    it 'displays a post author' do
      expect(page).to have_content @post_one.author.name
    end

    it 'displays a post comments counter' do
      expect(page).to have_content @post_one.comments_counter
    end

    it 'displays a post likes counter' do
      expect(page).to have_content @post_one.likes_counter
    end

    it 'displays a post comments' do
      @post_one.comments.each do |comment|
        expect(page).to have_content comment.text
      end
    end

    it 'displays a link for Add new Post ' do
      expect(page).to have_content 'Add new Post'
    end

    it 'redirects to the posts page when a post is clicked' do
      within all('.post').first do
        click_link @post_one.title
      end
    end
  end
end