class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # the following line is different to the tutorial because i want see 
      # if it is equivalent to sign_in user
      sign_in(user)
      redirect_to user
    else
    
      flash.now[:error]="Invalid email/password combination"
      render 'new'
    end
  end
  def destroy
     sign_out
     redirect_to root_url
  end
end
