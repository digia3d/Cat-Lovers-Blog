class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_commit :update_likes_counter, on: :create

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
