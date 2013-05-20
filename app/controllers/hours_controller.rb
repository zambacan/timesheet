class HoursController < ApplicationController
  

  
  def new
    @hour=Hour.new
  end
  
  def index
   @hours=Hour.all
  end
  
  def create
    @hours = Hour.new(params[:hour])

    respond_to do |format|
      if @hours.save
        # flash[:success] = "Timesheet updated"
        format.html { redirect_to hours_path, notice: 'Timesheet was successfully updated.' }
        format.json { render json: @hours, status: :created, location: @project }
      else
        format.html { render action: "new"}
        format.json { render json: @hours.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def destroy
    @hour=Hour.find(params[:id])
    @hour.destroy

    respond_to do |format|
      format.html { redirect_to hours_url }
      format.json { head :no_content }
    end
  end
  
  
  
end


