class SensorsController < ApplicationController
  def index
    render text: "index".html_safe 
  end

  def portal
    @message = {"key": "value"}
    respond_to do |format|
      format.html{render plain: "ok"}
      format.json{render json: @message}
    end
  end
  
  def create
    @sensor = Sensor.find_or_create_by(params[:device_id])
    render plain: "ok"
  end
end
