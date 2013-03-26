class ClientsController < ApplicationController
   before_filter :signed_in_user, only: [:index, :show, :edit, :update]
  def index
    @clients = Client.search(params[:search]).paginate(page: params[:page])
  end
end
