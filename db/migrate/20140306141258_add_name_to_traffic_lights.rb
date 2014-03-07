class AddNameToTrafficLights < ActiveRecord::Migration
  def change
    add_column :traffic_lights, :name, :string
  end
end
