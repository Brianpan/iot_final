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

require 'test_helper'

class SensorLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
