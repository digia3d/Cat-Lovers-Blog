require 'rails_helper'

RSpec.describe 'posts/index', type: :feature do
  before(:each) do
    assign(:posts, [
      Post.create!(
        title: 'Title',
        content: 'MyText'
      ),
      Post.create!(
        title: 'Title',
        content: 'MyText'
      )
    ])
  end

  it 'should render index template' do
    render
    expect(rendered).to render_template(:index)
  end
end