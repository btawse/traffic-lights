class TrafficLight < ActiveRecord::Base
  belongs_to :junction

  validates :junction_id, :presence => true

  @@values = ["Red", "Yellow", "Green"]
  
  def next!
    self.colour = next_colour
  end

  public
  def values
    @@values
  end

  private

  def next_colour

    if colour == @@values.last
      @@values.first
    else
      @@values[@@values.index(colour) + 1]
    end
  end

end
