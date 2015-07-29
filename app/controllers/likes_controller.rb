class LikesController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@like = @post.likes.build(user: current_user())
  	@like.save!

  	respond_to do |format|
  		format.js
  	end
  end
end
