class UsersController < ApplicationController
  def new
    @user= User.new
  end
  def show
    @user=User.find(params[:id])
  end
  def create
    @user=User.new(params[:user])
    if @user.save
      # handle a successful save
       flash[:success] = "Welcome to the Swashfly Invoice System!"
      redirect_to @user
    else
      render 'new'
    end
    
  end
end
