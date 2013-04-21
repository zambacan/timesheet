class ClientsController < ApplicationController
   # before_filter :signed_in_user, only: [:index, :show, :edit, :update]
   before_filter :signed_in_user, only: [:index, :show]
   
  def index
    # @clients = Client.search(params[:search]).paginate(page: params[:page])
    @clients = Client.search(params[:search]).paginate(page: params[:page], per_page: 10)
  end
  def show
    @client=Client.find(params[:id])
    @contacts=@client.contacts
  end
end
