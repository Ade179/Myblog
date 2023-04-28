class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter
  after_destroy :delete_posts_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_latest_comments
    comments.order('created_at DESC').limit(5)
  end

  def comments_counter
    comments.count
  end

  def likes_counter
    likes.count
  end


  private

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def delete_posts_counter
    author.decrement!(:posts_counter)
  end
end
