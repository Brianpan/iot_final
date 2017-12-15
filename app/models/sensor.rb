# == Schema Information
#
# Table name: sensors
#
#  id         :integer          not null, primary key
#  lat        :float(24)
#  lng        :float(24)
#  fail       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sensor < ApplicationRecord
end
