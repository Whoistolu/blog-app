# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: "Ben", photo: "url", bio: "Hey my name is ben, I'm dev", posts_counter: 0)
user2 = User.create(name: "Taliah", photo: "url", bio: "Hey my name is Taliah", posts_counter: 0)
user3 = User.create(name: "Omar", photo: "url", bio: "Hey my name is Omar", posts_counter: 0)
user4 = User.create(name: "Deen", photo: "url", bio: "Hey my name is Deen", posts_counter: 0)

post1 = user1.posts.create!(user_id: 1, title: 'Cats and Dogs', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)
post2 = user1.posts.create!(user_id: 1, title: 'Food', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)
post3 = user1.posts.create!(user_id: 1, title: 'Cars', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', comments_counter: 0, likes_counter: 0)