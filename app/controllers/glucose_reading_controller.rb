class GlucoseReadingController < ApplicationController

  def add_entry
    @glucose_reading = GlucoseReading.new(glucose_reading_params)
    get_user_readings_of_the_day(params["reading"]["observation_date"])
    respond_to do |format|
      if @glucose_reading.save
        flash[:success] = "Entry saved Successfully!!"
        format.js { render :show_readings , locals: { readings: @glucose_reading }}
      else
        format.js { render :show_readings , locals: { readings: @glucose_reading }}
      end
    end
  end

  def readings
    @glucose_reading = GlucoseReading.new
  end

  def show_readings
    get_user_readings_of_the_day(params[:observation_date])
    respond_to do |format|
      format.js 
    end
  end

  def get_user_readings_of_the_day(observation_date)
    @readings_of_the_day = GlucoseReading.where(:user_id => current_user.id, :observation_date => observation_date).all
    @count = @readings_of_the_day.count 
  end

  def glucose_reading_params
    params.require(:reading).permit(:glucose_level, :observation_date).merge(user_id: current_user.id)
  end
  
end
