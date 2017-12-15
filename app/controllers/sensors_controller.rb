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
    @sensor = Sensor.find_or_create_by(id: params[:device_id].to_i)
    @sensor.sensor_locations.create(lat: params[:lat].to_f, lng: params[:lng].to_f)
    render plain: "ok"
  end
end
