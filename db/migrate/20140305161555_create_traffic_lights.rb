class CreateTrafficLights < ActiveRecord::Migration
  def change
    create_table :traffic_lights do |t|
      t.string :colour
      t.integer :junction_id

      t.timestamps
    end
  end
end
