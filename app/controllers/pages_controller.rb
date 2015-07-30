class PagesController < ApplicationController
  def index
	if session[:user_id].nil?
		redirect_to about_path
	else
		@post = current_user.posts.build
		@posts = Post.all.order(:created_at)
		render 'posts/new'
	end
  end

  def about
  end
end
