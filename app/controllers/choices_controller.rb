class ChoicesController < ApplicationController
  before_action :set_truck

  def index
  end

  def create
    @tol = TruckOrderList.new(truck: @truck)
    @basket = Basket.new(user: current_user, truck_order_list: @tol)
    @choice = Choice.new(truck: @truck, basket: @basket, user: current_user)
    @method = :patch
    redirect_to truck_path(@truck)

  end

  def update
    redirect_to truck_path(@truck)
  end

  private

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

  def choice_param
    params.require(:choice).permit(:truck_id)
  end
end
