module PagesHelper
	def logged_in?
		!session[:user_id].nil?
	end
	def all_posts
		@posts = Post.all.order(:created_at)
	end
end
