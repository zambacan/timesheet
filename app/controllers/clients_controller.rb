class ClientsController < ApplicationController
  # before_filter :signed_in_user, only: [:index, :show, :edit, :update]
  before_filter :signed_in_user, only: [:index, :new, :show]

  def index
    # @clients = Client.search(params[:search]).paginate(page: params[:page])
    @clients = Client.search(params[:search]).paginate(page: params[:page], per_page: 10)
  end
  def show
    @client=Client.find(params[:id])
    @contacts=@client.contacts
  end
  def new
    @client=Client.new
    @client.contacts.build 
  end

  def create
    @client = Client.new(params[:client])
    
    @client.save
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new"}
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @client=Client.find(params[:id])

  end
  def update
    @client=Client.find(params[:id])
    # @user=User.find(params[:id])
    if @client.update_attributes(params[:client])
      # handle successful update
      flash[:success]="Profile updated"
      # the following line signs out the user for some reason???!!!

      redirect_to @client 

    else
      # no luck there buddy 
      render 'edit'
    end
  end
end
