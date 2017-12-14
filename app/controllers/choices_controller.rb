class ChoicesController < ApplicationController
  before_action :set_truck
  before_action :set_choice, only: [:update]

  def index
  end

  def create
    # @tol = TruckOrderList.new(truck: @truck)
    # @basket = Basket.new(user: current_user, truck_order_list: @tol)
    @choice = Choice.new(choice_param)
    @choice.truck = @truck
    @choice.user = current_user
    if @choice.save
      @choice.price = @choice.quantity * @choice.meal.price
      @choice.save
      redirect_to truck_path(@truck)
    else
      flash[:alert] = "test"
      redirect_to truck_path(@truck)
    end


  end

  def update
    if @choice.update(choice_param)
      @choice.price = @choice.quantity * @choice.meal.price
      @choice.save
      redirect_to truck_path(@truck)
    else
      flash[:alert] = "test"
      redirect_to truck_path(@truck)
    end
  end

  private

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

  def set_choice
    @choice = Choice.find(params[:id])
  end

  def choice_param
    params.require(:choice).permit(:truck_id, :quantity, :meal_id, :basket_id)
  end
end
