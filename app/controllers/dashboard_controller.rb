class DashboardController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = current_user
	end

	def map_sensor_data
		@data = {}
		last_loc = current_user.sensor.sensor_locations.last
		@data["current"] = {"x": last_loc.lat, "y": last_loc.lng}
  		# rest of pts
  		@data["history"] = current_user.history_locations
  		@data["barchart"] = current_user.history_barchart
  		render json: @data
	end
end
