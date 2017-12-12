class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]
  before_action :set_all_trucks, only: [:home, :index]


  def home
  end

  def index
  end

  def new
    @truck = Truck.new
  end

  def show
  end

  def create
    user = current_user
    @truck = Truck.new(truck_params)
    @truck.user = user
    if @truck.save
      redirect_to truck_path(@truck)
    else
      render :new
    end
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

  def set_all_trucks
    @trucks = Truck.all
  end

  def set_truck
    @truck = Truck.find(params[:id])
  end

  def truck_params
    params.require(:truck).permit(:name, :type_of_food, :pay_online, :payment_info, photos: [])
  end
end
