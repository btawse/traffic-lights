class Junction < ActiveRecord::Base
  has_many :traffic_lights, dependent: :destroy
  validates :name, :presence => true

  def rotate!
    self.traffic_lights.each do |traffic_light|
      traffic_light.next!
      traffic_light.save
    end
  end
end
