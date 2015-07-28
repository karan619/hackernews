class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if(user && user.authenticate(params[:session][:password]))
  		session[:user_id] = user.id
  		redirect_to root_url
      flash[:success] = "Login Successful"
  	else
      redirect_to login_path
      flash[:danger] = "Invalid email/password"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
