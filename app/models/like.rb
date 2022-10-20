class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_commit :update_likes_counter, on: :create

  private

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
