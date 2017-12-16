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
    s = @sensor.sensor_locations.create(lat: params[:lat].to_f, lng: params[:lng].to_f)
    send_text_message(s)

    render plain: "ok"
  end

  private
  def send_text_message(s)
    number_to_send_to = "xxx"
    twilio_sid = "xxx"
    twilio_token = "yyy"
    twilio_phone_number = "yyy"

    body = "[Falling Warning] sensor_id: 1, lat: #{s.lat}, lng: #{s.lng}, time: #{s.created_at}"
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.api.account.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => body
    )
  end

end
