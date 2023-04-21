# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Daniel', photo: "https://picsum.photos/200/500", bio: 'El cashico.')
second_user = User.create(name: 'Tom', photo: "https://picsum.photos/300/500", bio: 'Teacher from Mexico.')
third_user = User.create(name: 'Lilly', photo: "https://picsum.photos/300/400", bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'yoooo', text: 'This is my second post')
third_post = Post.create(author: second_user, title: 'Hello', text: 'What a post')
fourth_post = Post.create(author: third_user, title: 'Hello', text: 'This is my first post')

Comment.create(post: first_post, author: first_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: second_user, text: 'Hello!' )
Comment.create(post: second_post, author: second_user, text: 'Go,Cats!')
Comment.create(post: third_post, author: second_user, text: 'lol!')
Comment.create(post: first_post, author: third_user, text: 'snoutss!')
Comment.create(post: second_post, author: third_user, text: 'goo!')
Comment.create(post: third_post, author: third_user, text: 'Hey!')
























