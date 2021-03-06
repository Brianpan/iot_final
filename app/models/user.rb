# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  sensor_id              :integer
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :sensor, required: false

  def history_locations
    history_data = []
    sensor.sensor_locations.order(id: :desc).offset(1).each do |d|
      history_data << {"x": d.lat, "y": d.lng}
    end
    history_data
  end

  def history_barchart
    history_barchart = []
    group_data = sensor.sensor_locations.group("WEEKDAY(created_at)").count
    (0..6).each do |wday|
      if group_data[wday].nil?
        history_barchart << 0
      else
        history_barchart << group_data[wday]
      end
    end
    history_barchart
  end

end
