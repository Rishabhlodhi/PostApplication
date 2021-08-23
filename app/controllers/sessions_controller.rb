class SessionsController < ApplicationController
    
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/posts'
    else
      render 'new'
    end
  end
   
  def destroy
    session[:user_id] = nil
    render 'new'
  end
end
