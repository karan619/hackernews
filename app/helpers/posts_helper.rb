module PostsHelper
	def liked_users_names(p)
		@arr = Array.new
		p.liked_users.take(3).each do |user|
			@arr.push(user.name)
		end
		@arr.push("...")
		@arr.join(", ")
	end
end
