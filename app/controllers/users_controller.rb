class UsersController < ApplicationController
	before_action :logged_in?, only: [:mylikes, :myposts]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url
		end
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.order(created_at: :desc)
	end

	def mylikes
		@likes = current_user().liked_posts
	end

	def myposts
		@posts = current_user().posts.order(created_at: :desc)
	end
	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
