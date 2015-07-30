class LikesController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@like = @post.likes.build(user: current_user())

  	if @like.save
  	respond_to do |format|
  		format.html {render 'posts/new'}
  	end
	  else
	  	render 'posts/new'
	  end
  end
end
