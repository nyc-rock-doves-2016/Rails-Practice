class SessionsController < ApplicationController

 def new
  @user = User.new
 end

 def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
 end

 def destroy
  # user = User.find_by(id: session[:user_id])
  session.clear
  redirect_to root_path
 end

end
