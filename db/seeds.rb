# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pas = "password"
User.create!(name: "Karan Valecha", email: "karan.valecha92@gmail.com", password: pas, password_confirmation: pas)
15.times do
	name = Faker::Name.name
	email = Faker::Internet.free_email(name)
	User.create!(name: name, email: email, password: pas, password_confirmation: pas)
end

users = User.all.order(:created_at).take(10)

	users.each do |user|
		domain = Faker::Internet.domain_word
		domain += "." + Faker::Internet.domain_suffix
		label = Faker::Company.bs
		link = Faker::Internet.url(domain)
		 user.posts.create!(label: label, link: link)
	 end

users = User.all.order(created_at: :desc).take(10)
posts = Post.all.order(:created_at).take(10)
posts.each do |post|
	users.each{ |user| post.likes.create!(user: user)  }
end