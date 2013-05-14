class HoursController < ApplicationController
  
  def new
    @hour=Hour.new
  end
  
  def index
   @hours=Hour.all
  end
end
