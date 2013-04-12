class ContactsController < ApplicationController
  before_filter :signed_in_user

def new
  # @client=Client.find(params[:client_id])
# @contact=@client.contacts.new
# @contact.client_id=params[:client_id]
client=Client.find(params[:client_id])
@contact=client.contacts.new
end
def create
  @client = Client.find(params[:contact][:client_id])
  #the following line was the only way i could find to avoid generating a mass assignment error:
  params[:contact].delete(:client_id)
  @contact= @client.contacts.build(params[:contact])
  respond_to do |format|
          
      if @contact.save
      
      format.html { redirect_to @client, notice: 'Client was successfully created.' }
      format.json { render json: @client, status: :created, location: @client }
      
    else
      format.html { render action: "new" }
      format.json { render json: @client.errors, status: :unprocessable_entity }
    end
  end
end
end