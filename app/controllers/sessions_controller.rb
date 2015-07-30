class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if(user && user.authenticate(params[:session][:password]))
  		session[:user_id] = user.id
      flash[:success] = "Login Successful"
      redirect_to root_url
      flash[:warning] = "Allow the Pop-ups to access the links!!!"
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
