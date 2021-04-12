# class SessionsController < ApplicationController
#   def new
#   end
#   def create 
#     user = User.find_by(email: params[:session][:email].downcase)
#     if user  && user.authenticate(params[:session][:password])
#      session[:user_id] = user.id
#      flash[:success] = "You have logged in"
#      redirect_to users_path(user)
#     else
#      flash.now[:danger] = "There was something wrong with your login information"
#      render 'new'
#     end
#   end

#   def create 
#    end
#    def destroy
#     session[:user_id] = nil
#     flash[:success] = "You have logged out"
#     redirect_to root_path
#    end
#   end

class SessionsController < ApplicationController
  def new
 end
  def create
   user = User.find_by_email(params[:email])
   if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to articles_path , notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
 end
 