class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
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
      sign_in @user
      flash[:success] = "Welcome to the Swashfly Invoice System!"
      redirect_to @user
    else
      render 'new'
    end

  end
  def edit
    # @user = current_user 
    # --- this works but it is not what we are trying to do
    # we need to be able to edit other users...provided we are authorised to do so
    @user=User.find(params[:id])
  end
  def update

    # put the code here that updates the user details
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user])
      # handle successful update
      flash[:success]="Profile updated"
      # the following line signs out the user for some reason???!!!
      sign_in @user
      redirect_to @user 

    else
      # no luck there buddy 
      render 'edit'
    end
  end

  private
      def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in." 
      end  
    end
    def correct_user
      @user=User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)

    end
end
