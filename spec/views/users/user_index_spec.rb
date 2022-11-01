require 'rails_helper'

RSpec.describe 'User index', type: :system do
  before (:each) do
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

    @users = User.all
  end

  describe 'views/users' do
    before(:each) {visit users_path(@user)}

    scenario 'shows the user index page' do
      @users.each do |user|
        expect(page).to have_content 'Blog App'
      end
    end

    scenario 'shows the username of all other users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    scenario 'displays number of posts each user has written' do
      @users.each do |user|
        expect(page).to have_content "Number of posts: #{user.posts_counter}"
      end
    end

    scenario 'users directs to show page when clicked' do
      within all('.user')[0] do
        click_link @user1.name
        expect(page).to have_current_path user_path(@user1)
        visit users_path
      end
    end
  end
end

