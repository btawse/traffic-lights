class JunctionsController < ApplicationController


  def create
    @junction = Junction.new(junction_params)
    if @junction.save
      redirect_to @junction
    else
      render action: :new
    end

  end

  def show
    @junction = Junction.find(params[:id])
  end

  def edit
    @junction = Junction.find(params[:id])
  end

  def update
    @junction = Junction.find(params[:id])
    if @junction.update(junction_params)
      redirect_to @junction
    else
      render action: :edit
    end
  end

  def destroy
    @junction = Junction.find(params[:id])
    @junction.destroy
    redirect_to junctions_path
  end

  def rotate
    @junction = Junction.find(params[:id])
    @junction.rotate!
    redirect_to junctions_path
  end

  def rotateall
    Junction.all.each do |junction|
      junction.rotate!
    end
    redirect_to junctions_path
  end

  private
    def junction_params
      params.require(:junction).permit(:name)
    end
end
