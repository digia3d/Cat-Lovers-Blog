require 'rails_helper'

RSpec.describe 'User index', type: :system do
  describe 'user index page' do
    before :all do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico', posts_counter: 0)
    end
    after :all do
      @user.destroy
    end
    it 'shows the user index page' do
      visit users_path
      expect(page).to have_content 'Tom'
    end

    it 'shows the user show page' do
      visit user_path(@user)
      expect(page).to have_content 'Tom'
    end
  end
end
