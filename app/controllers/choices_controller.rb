class ChoicesController < ApplicationController
  before_action :set_truck_and_basket
  before_action :set_choice, only: [:update]

  def index
  end

  def create
    @choice = Choice.new(choice_param)
    @choice.basket = @basket
    @choice.user = current_user
    if @choice.save
      @choice.update(price: (@choice.quantity * @choice.meal.price))
      @basket.update(total_price: @basket.choices.sum(&:price))
      redirect_to truck_path(@truck)
    else
      flash[:alert] = "test"
      redirect_to truck_path(@truck)
    end
  end

  def update
    if @choice.update(choice_param)
      @choice.update(price: (@choice.quantity * @choice.meal.price))
      @basket.update(total_price: @basket.choices.sum(&:price))
      redirect_to truck_path(@truck)
    else
      flash[:alert] = "test"
      redirect_to truck_path(@truck)
    end
    # raise
  end

  private

  def set_truck_and_basket
    @truck = Truck.find(params[:truck_id])
    @basket = Basket.where(user: current_user, truck: @truck, status: "pending").last || Basket.create(user: current_user, status: "pending", truck: @truck)
  end

  def set_choice
    @choice = Choice.find(params[:id])
  end

  def choice_param
    params.require(:choice).permit(:truck_id, :quantity, :meal_id, :basket_id)
  end
end
