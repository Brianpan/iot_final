# == Schema Information
#
# Table name: sensor_locations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sensor_id  :integer
#  lng        :float(24)
#  lat        :float(24)
#

class SensorLocation < ApplicationRecord
	belongs_to :sensor
end
