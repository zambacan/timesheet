class ContactsController < ApplicationController
  before_filter :signed_in_user

# def new
#   # @client=Client.find(params[:client_id])
# # @contact=@client.contacts.new
# # @contact.client_id=params[:client_id]
# client=Client.find(params[:client_id])
# @contact=client.contacts.new
# end
end