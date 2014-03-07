class TrafficLightsController < ApplicationController

  before_filter :find_traffic_light, :except => :create
  
  def new
    if @traffic_light
        @errors = @traffic_light.errors.full_messages
    end
  end

  def create
    @traffic_light = TrafficLight.new(traffic_light_params) # create a new instance variable, which is a TrafficLight object with the parameters that we just received from the html POST
    if @traffic_light.save  # if its able to save the traffic light then show it
      redirect_to junctions_path
    else  # else go back to the 'create new' screen
      render :action => :new
    end
  end

  def edit  # new is to edit as create is to update
    @traffic_light = TrafficLight.find(params[:id]) 
  end

  def update  # that is, new and edit open the page to allow you to enter values, while create and update send those values to the database
    @traffic_light = TrafficLight.find(params[:id])
    if @traffic_light.update(params[:traffic_light].permit(:junction_id, :colour))
      redirect_to @traffic_light
    else
      render :action => :edit
    end
  end

  def destroy
    TrafficLight.find(params[:id]).destroy
    redirect_to @traffic_light
  end

  def show
    @traffic_light = TrafficLight.find(params[:id]) # pulls a traffic light back out of the database based on the ID which is still in the POST parameters
  end

  def index
    @traffic_lights = TrafficLight.all
  end


  private

    def traffic_light_params
      params.require(:traffic_light).permit(:junction_id, :colour)
    end

    def find_traffic_light
      @traffic_light = TrafficLight.new()
    end

end
