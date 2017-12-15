class CreateSensor < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
    	t.timestamps
    	t.string :name
    end
  end
end
