# spec/factories/comments.rb

FactoryBot.define do
  factory :comment do
    text { 'Comment Text' }
    association :user
    association :post
    after(:create) do |comment|
      comment.post.update(posts_counter: comment.post.comments.count) # Update the posts_counter attribute of the associated post
    end
  end
end
