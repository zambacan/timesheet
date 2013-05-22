class HoursController < ApplicationController
  

  
  def new
    @hour=Hour.new
  end
  
  def index
   @hours=Hour.all
  end
  
  def create
    @hour = Hour.new(params[:hour])

    respond_to do |format|
      if @hour.save
        # flash[:success] = "Timesheet updated"
        format.html { redirect_to hours_path, notice: 'Timesheet was successfully updated.' }
        format.json { render json: @hour, status: :created, location: @hour }
      else
         # format.html { redirect_to hours_path, notice: 'Timesheet was NOT updated.' }
        format.html { render action: "new"}
        format.json { render json: @hour.errors, status: :unprocessable_entity }
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


