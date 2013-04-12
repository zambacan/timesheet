class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # the following two lines are equivalent
      # sign_in(user)
      sign_in user
      redirect_back_or(clients_path)
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
