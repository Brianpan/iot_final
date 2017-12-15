class CreateSensorLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :sensor_locations do |t|

      t.timestamps
      t.integer :sensor_id
      t.float :lng
      t.float :lat
    end
  end
end
