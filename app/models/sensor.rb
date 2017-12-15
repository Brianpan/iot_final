# == Schema Information
#
# Table name: sensors
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sensor < ApplicationRecord
	has_many :sensor_locations
	has_many :users
end
