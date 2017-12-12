class TrucksController < ApplicationController

before_action :set_truck, only: [:show, :edit, :update, :destroy]

  def index
    @trucks = Truck.all
  end

  def show

  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.save
    # redirect_to truck_path(@truck)
  end

  def edit
  end

  def update

    @truck.update(truck_params)
    redirect_to truck_path(@truck)
  end

  def destroy
    @truck.destroy
    redirect_to trucks_path
  end


  private

  def set_truck
    @truck = Truck.find(params[:id])
  end

  def truck_params
    params.require(:truck).permit(:name, :type_of_food, :pay_online, :payment_info)
  end
end
