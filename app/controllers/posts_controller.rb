class PostsController < ApplicationController
	before_action :logged_in?

def new
	@user = current_user()
	@post = @user.posts.build
end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  		flash[:succeess] = "created new posts"
  		redirect_to user_path(current_user)
	else
		render 'pages/index'
	end

  end

  def destroy
  end

private
	def logged_in?
		if session[:user_id].nil?
			flash[:danger] = "Log In to continue"
			redirect_to login_path
		end
	end
	def post_params
		params.require(:post).permit(:label, :link)
	end
	def current_user
		User.find_by(id: session[:user_id])
	end

end
